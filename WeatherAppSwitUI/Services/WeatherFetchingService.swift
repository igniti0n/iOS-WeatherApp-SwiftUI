//
//  WeatherFetchingService.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 11.10.2021..
//

import Foundation
import CoreLocation
import Combine

protocol WeatherFetcher {
  func fetchWeatherForCity(cityName: String) -> AnyPublisher<Weather, Error>
  func fetchWeatherForLocation(location: CLLocationCoordinate2D) -> AnyPublisher<Weather, Error>
}

private extension WeatherFetcher {
  // MARK: - FETCHIGN DATA WITH PUBLISHER-SUBSCRIBER
  func fetchWeatherData(url: URL) -> AnyPublisher<Weather, Error> {
    URLSession.shared.dataTaskPublisher(for: url)
      .tryMap({(data: Data, response: URLResponse) -> Weather in
        guard
          let response = response as? HTTPURLResponse,
          (200...299).contains( response.statusCode) == true
        else {
          throw NetworkError.NetworkFetchingError
        }
        guard
          let jsonMap = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
          let weather = Weather.fromJson(map: jsonMap)
        else{
          throw NetworkError.DecodingError
        }
        
        return weather
      })
      .eraseToAnyPublisher()
  }
}

class WeatherFetchingService: WeatherFetcher {
  private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
  private let apiKey = "33a595b1052037a58ebbd6503b0303ac"
}

// MARK: - Weather fetching
extension WeatherFetchingService{
  func fetchWeatherForLocation(location: CLLocationCoordinate2D) -> AnyPublisher<Weather, Error> {
    var components = URLComponents(string: baseUrl)!
    components.queryItems = [
      URLQueryItem(name: "lat", value: String(location.latitude)),
      URLQueryItem(name: "lon", value: String(location.longitude)),
      URLQueryItem(name: "appid", value: apiKey)
    ]
    return fetchWeatherData(url: components.url!)
  }
  func fetchWeatherForCity(cityName: String) -> AnyPublisher<Weather, Error> {
    var components = URLComponents(string: baseUrl)!
    components.queryItems = [
      URLQueryItem(name: "q", value: cityName),
      URLQueryItem(name: "appid", value: apiKey)
    ]
    return fetchWeatherData(url: components.url!)
  }
}


