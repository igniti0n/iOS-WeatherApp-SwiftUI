//
//  LocationSearchPresenter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation

class LocationSearchPresenter: PresenterInterface {
  var interactor: LocationSearchInteractorPresenter!
  var router: LocationSearchRouterPresenter!
  weak var viewModel: LocationSearchViewState!
}

extension LocationSearchPresenter: LocationSearchPresenterView {
  func fetchWeatherDataForCity(cityName: String, searchedCities: [String]?) {
    interactor.fetchWeatherDataForCity(cityName: cityName) { [weak self] in
      if var cities = searchedCities {
        if !cities.contains(cityName.lowercased()) {
          cities.insert(cityName.lowercased(), at: 0)
          self?.interactor.saveCitiesToStorage(cities: cities)
        }
      }
    }
  }
  func readCitiesFromStorage() {
    interactor.readCitiesFromStorage()
  }
}

extension LocationSearchPresenter: LocationSearchPresenterInteractor {
  func renderContent(cities: [String]) {
    viewModel.state = .loaded(cities)
  }
  func renderError(error: Error) {
    viewModel.hasError = true
  }
  func renderLoading() {
    viewModel.state = .loading
  }
}

extension LocationSearchPresenter: LocationSearchPresenterRouter {
  func goBackToHome() {
    router.goBackToHome()
  }
}
