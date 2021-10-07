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
        fetchWeatherData(url: components.url!, successHandler: nil)
    }
    func fetchWeatherDataCityName(cityName: String) {
        var components = URLComponents(string: baseUrl)!
        components.queryItems = [
            URLQueryItem(name: "q", value: cityName),
            URLQueryItem(name: "appid", value: apiKey)
        ]
        fetchWeatherData(url: components.url!) {
            CitiesStorage.saveSearchedCitiesToUserDefaults(newCity: cityName)
        }
    }
}

private extension WeatherReperesentationViewModel {
    // MARK: - FETCHIGN DATA WITH PUBLISHER-SUBSCRIBER
    func fetchWeatherData(url: URL, successHandler: (()->Void)?) {
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
              } receiveValue: {  [weak self] output in
                switch output {
                case .failure(_):
                    print("failed to fetch data")
//                    self?.weather = Weather.dummyWeather
//                    self?.fetchWeatherDataCityName(cityName: "London")
                case .success(let newWeather):
                    self?.weather = newWeather
                    successHandler?()
                }
            }
            .store(in: &cancaelablesSet)
    }

}

