//
//  WeatherStorage.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation

class WeatherStorage {
  static let WEATHER_KEY = "weather"
  
  static func saveWeatherToUserDefaults(weather: Weather) {
    let defaults = UserDefaults.standard
    guard
      let encodedData = weather.toData()
    else {
      return
    }
    defaults.setValue(encodedData, forKey: WEATHER_KEY)
  }
  
  static func readWeatherCitiesFromUserDefaults()  -> Weather? {
    let defaults = UserDefaults.standard
    guard
      let encodedData = defaults.data(forKey: WEATHER_KEY),
      let weather = Weather.fromData(data: encodedData)
    else {
      return nil
    }
    return weather
  }
  static func deleteWeatherFromUserDefaults() {
    UserDefaults.standard.removeObject(forKey: WEATHER_KEY)
  }
}
