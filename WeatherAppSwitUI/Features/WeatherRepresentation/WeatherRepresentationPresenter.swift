//
//  WeatherRepresentationPresenter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 10.10.2021..
//

import Foundation

class WeatherRepresentationPresenter: PresenterInterface {
  var interactor: WeatherRepresentationInteractorPresenter!
  var router: WeatherRepresentationRouterPresenter!
  weak var viewModel: WeatherReperesentationViewModel!
}

extension WeatherRepresentationPresenter: WeatherRepresentationPresenterInteractor {
  func renderContent(weather: Weather) {
    viewModel.weatherState = .loaded(weather)
  }
  func renderError(error: Error) {
    viewModel.isErrorAlertShown = true
    viewModel.weatherState = .error(NetworkError.NetworkFetchingError)
  }
  func renderLoading() {
    viewModel.weatherState = .loading
  }
}

extension WeatherRepresentationPresenter: WeatherRepresentationPresenterView {
  func navigateToSearch() {
    router.navigateToSearch(viewModel: LocationSearchViewModel())
  }
  func navigateToSettings() {
    router.navigateToSettings(viewModel: WeatherSettingsViewModel())
  }
  func getCurrentWeatherSettings() {
    viewModel.settings.settings = interactor.getCurrentWeatherSettings()
  }
  func getCurrentWeather() {
    interactor.getCurrentWeather()
  }
}

extension WeatherRepresentationPresenter: WeatherRepresentationPresenterRouter {
  
}
