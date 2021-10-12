//
//  WeatherSettingsInteractor.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation

class WeatherSettingsInteractor: InteractorInterface {
    weak var presenter: WeatherSettingsPresenterInteractor!
}

extension WeatherSettingsInteractor: WeatherSettingsInteractorPresenter {
    func saveSettingsToUserDefaults(settings: Settings) {
        SettingsStorage.saveSettingsToUserDefaults(settings: settings)
    }
    func readSettingsFromUserDefaults() -> Settings {
        SettingsStorage.readSettingsFromUserDefaults()
    }
}
