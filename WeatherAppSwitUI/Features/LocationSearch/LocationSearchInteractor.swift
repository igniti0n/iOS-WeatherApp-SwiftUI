//
//  LocationSearchInterctor.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation
import Combine

class LocationSearchInteractor: InteractorInterface {
  weak var presenter: LocationSearchPresenterInteractor!
  
  private var cancaelablesSet = Set<AnyCancellable>()
  private let weatherFetcher = WeatherFetchingService()
}

extension LocationSearchInteractor: LocationSearchInteractorPresenter {
  // MARK: - API
  func fetchWeatherDataForCity(cityName: String, onSuccess: @escaping () -> Void) {
    presenter.renderLoading()
    weatherFetcher.fetchWeatherForCity(cityName: cityName)
      .receive(on: RunLoop.main)
      .sink { [weak self] completion in
        if case .failure(let error) = completion {
          self?.readCitiesFromStorage()
          self?.presenter.renderError(error: error)
        }
      } receiveValue: { [weak self] weather in
        onSuccess()
        WeatherStorage.saveWeatherToUserDefaults(weather: weather)
        self?.presenter.goBackToHome()
      }
      .store(in: &cancaelablesSet)
    
  }
  // MARK: - User defaults
  func readCitiesFromStorage() {
    presenter.renderLoading()
    let cities = CitiesStorage.readSearchedCitiesFromUserDefaults()
    presenter.renderContent(cities: cities)
  }
  
  func saveCitiesToStorage(cities: [String]) {
    CitiesStorage.saveSearchedCitiesToUserDefaults(newCities: cities)
  }
}

