//
//  WeatherRepresentationInteractor.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 10.10.2021..
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

class WeatherRepresentationInteractor: InteractorInterface {
    weak var presenter: WeatherRepresentationPresenterInteractor!
    
    private var cancaelablesSet = Set<AnyCancellable>()
    private let weatherFetcher = WeatherFetchingService()
    private let locationService: LocationService!
    
    init() {
        locationService = LocationService()
        locationService.start()
        locationService.locationChangedHandler = fetchWeatherForCurrentLocation
    }
}

extension WeatherRepresentationInteractor: WeatherRepresentationInteractorPresenter {
    // MARK: - API Communication
    func fetchWeatherForCity(cityName: String) {
        weatherFetcher.fetchWeatherForCity(cityName: cityName)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.presenter.renderError(error: error)
                }
            } receiveValue: {  [weak self] output in
                self?.presenter.renderContent(weather: output)
            }
            .store(in: &cancaelablesSet)
    }
    func fetchWeatherForCurrentLocation(location: CLLocationCoordinate2D) {
        print("Location changed")
        weatherFetcher.fetchWeatherForLocation(location: location)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    self?.presenter.renderError(error: error)
                }
            } receiveValue: {  [weak self] output in
                self?.presenter.renderContent(weather: output)
            }
            .store(in: &cancaelablesSet)
    }
}
