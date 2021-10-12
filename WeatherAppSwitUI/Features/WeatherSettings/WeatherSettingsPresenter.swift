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
    weak var viewModel: WeatherSettingsViewModel!
}

extension WeatherSettingsPresenter: WeatherSettingsPresenterInteractor {
}

extension WeatherSettingsPresenter: WeatherSettingsPresenterView {
    func saveSettingsToUserDefaults(settings: Settings) {
        interactor.saveSettingsToUserDefaults(settings: settings)
    }
    func getSettingsFromUserDefaults() {
        viewModel.settings = interactor.readSettingsFromUserDefaults()
    }
}

extension WeatherSettingsPresenter: WeatherSettingsPresenterRouter {
    
}
