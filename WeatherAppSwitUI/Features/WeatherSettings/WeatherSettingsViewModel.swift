//
//  WeatherSettingsViewModel.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation
import Combine

class WeatherSettingsViewModel: ObservableObject {
    @Published var settings: Settings!
    
    private var cancellable = Set<AnyCancellable>()
    private let settingsKey = "settings"
    
    init() {
        readSettingsFromDefaults()
        $settings.sink {[weak self] newSettings in
            if  let settings = newSettings {
                self?.saveSettingsToDefaults(newSettings: settings)
            }
        }.store(in: &cancellable)
    }
}
private extension WeatherSettingsViewModel {
    func saveSettingsToDefaults(newSettings: Settings) {
        let defaults = UserDefaults.standard
        guard
        let encodedData = newSettings.toData()
        else {
            return
        }
        defaults.setValue(encodedData, forKey: settingsKey)
    }
    
    func readSettingsFromDefaults(){
        let defaults = UserDefaults.standard
        guard
        let encodedData = defaults.value(forKey: settingsKey) as? Data
        else {
            return
        }
        let setFromData = Settings.fromData(data: encodedData)
        settings =  setFromData ?? Settings.defaultSettings()
    }
}

