//
//  SettingsStorage.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation

final class SettingsStorage {
  static let SETTINGS_KEY = "settings"
  
  static func readSettingsFromUserDefaults() -> Settings {
    let defaults = UserDefaults.standard
    guard
      let data = defaults.data(forKey: SETTINGS_KEY),
      let settings = Settings.fromData(data: data)
    else {
      return Settings.defaultSettings()
    }
    return settings
  }
  
  static func saveSettingsToUserDefaults(settings: Settings) {
    let defaults = UserDefaults.standard
    guard
      let data = settings.toData()
    else {
      return
    }
    defaults.setValue(data, forKey: SETTINGS_KEY)
  }
}
