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
            print("Settings changed!")
            self?.saveSettingsToDefaults(newSettings: newSettings!)
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
        print("Saved settings!")
    }
    
    func readSettingsFromDefaults(){
        let defaults = UserDefaults.standard
        guard
        let encodedData = defaults.value(forKey: settingsKey) as? Data
        else {
            return
        }
        let setFromData = Settings.fromData(data: encodedData)
        print("Settings form data: \(setFromData)")
        settings =  setFromData ?? Settings.defaultSettings()
    }
}

