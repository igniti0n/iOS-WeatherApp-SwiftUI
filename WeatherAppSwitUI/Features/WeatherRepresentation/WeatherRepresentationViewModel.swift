//
//  WeatherRepresentationViewModel.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation
import CoreLocation
import Combine

enum NetworkError: String, Error {
    case DecodingError = "Decoding data has failed."
    case NetworkFetchingError = "Fetching data from internet failed"
    
    var textDescription: String {
        self.rawValue
    }
}

class WeatherReperesentationViewModel: ObservableObject {
    @Published var weather: Weather = Weather.dummyWeather
    
    private var cancaelablesSet = Set<AnyCancellable>()
    private let locationService = LocationService()
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "33a595b1052037a58ebbd6503b0303ac"
    
    init() {
        locationService.start()
        locationService.locationChangedHandler = fetchWeatherDataLocation
    }
}

extension WeatherReperesentationViewModel {
    // MARK: - Fetching data from internet
    func fetchWeatherDataLocation(coordinates: CLLocationCoordinate2D) {
        var components = URLComponents(string: baseUrl)!
        components.queryItems = [
            URLQueryItem(name: "lat", value: String(coordinates.latitude)),
            URLQueryItem(name: "lon", value: String(coordinates.longitude)),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        fetchWeatherData(url: components.url!)
    }
    func fetchWeatherDataCityName(cityName: String) {
        var components = URLComponents(string: baseUrl)!
        components.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        fetchWeatherData(url: components.url!)
    }
}

private extension WeatherReperesentationViewModel {
    // MARK: - FETCHIGN DATA WITH PUBLISHER-SUBSCRIBER
    func fetchWeatherData(url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({ (data: Data, response: URLResponse) -> Result<Weather, NetworkError> in
                guard
                    let response = response as? HTTPURLResponse,
                    (200...299).contains( response.statusCode) == true
                else {
                    //throw URLError(.badServerResponse)
                    return .failure(.NetworkFetchingError)
                }
                guard
                let jsonMap = try? JSONSerialization.jsonObject(with: data) as? [String:Any],
                let weather = Weather.fromJson(map: jsonMap)
                else{
                    return .failure(.DecodingError)
                }
                
                return .success(weather)
            })
            .receive(on: RunLoop.main)
            .sink { completion in
                print("Data task completed: \(completion)")
            } receiveValue: {  [weak self] output in
                print("network data: \(output)")
                switch output {
                case .failure(let error):
                    self?.weather = Weather.dummyWeather
                    print("error occured: \(error.textDescription), \n trying to fetch for London...")
                    self?.fetchWeatherDataCityName(cityName: "London")
                case .success(let newWeather):
                    print("Fetching weather success!!!!")
                    self?.weather = newWeather
                }
            }
            .store(in: &cancaelablesSet)
    }

}

