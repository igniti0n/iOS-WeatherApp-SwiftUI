//
//  WeatherSettingsPresenter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation

class WeatherSettingsPresenter: PresenterInterface {
  var interactor: WeatherSettingsInteractorPresenter!
  var router: WeatherSettingsRouterPresenter!
  weak var viewModel: WeatherSettingsViewState!
}

extension WeatherSettingsPresenter: WeatherSettingsPresenterInteractor {
}

extension WeatherSettingsPresenter: WeatherSettingsPresenterView {
  func getSettingsFromUserDefaults() {
    viewModel.settings = interactor.readSettingsFromUserDefaults()
  }
  func changeMessurmentUnit() {
    viewModel.settings.changeMessurmentUnit()
    interactor.saveSettingsToUserDefaults(settings: viewModel.settings)
  }
  func toggleHumidity() {
    viewModel.settings.showHumidity.toggle()
    interactor.saveSettingsToUserDefaults(settings: viewModel.settings)
  }
  func togglePressure() {
    viewModel.settings.showPressure.toggle()
    interactor.saveSettingsToUserDefaults(settings: viewModel.settings)
  }
  func toggleWind() {
    viewModel.settings.showWind.toggle()
    interactor.saveSettingsToUserDefaults(settings: viewModel.settings)
  }
}

extension WeatherSettingsPresenter: WeatherSettingsPresenterRouter {
  
}
