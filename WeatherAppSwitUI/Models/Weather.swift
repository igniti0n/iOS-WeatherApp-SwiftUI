//
//  Weather.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation

import Foundation

struct Weather: Codable {
  var temperature: Double
  var minTemperature: Double
  var maxTemperature: Double
  var humidity: Double
  var pressure: Double
  var windSpeed: Double
  var conditionId: Int
  var name: String
  
  static let dummyWeather = Weather(temperature: 44, minTemperature: 10, maxTemperature: 10, humidity: 10, pressure: 10, windSpeed: 10, conditionId: 800, name: "London")
  
  static func fromJson(map: [String:Any]) -> Weather? {
    guard
      let weatherDictonaryArray = map["weather"] as? [Any],
      let weatherDictonary = weatherDictonaryArray.first as? [String:Any],
      let mainDictonary = map["main"] as? [String: Any],
      let windDictonary = map["wind"] as? [String: Any],
      let name = map["name"] as? String
    else{
      return nil
    }
    guard
      let temp = mainDictonary["temp"] as? Double,
      let minTemp = mainDictonary["temp_min"] as? Double,
      let maxTemp = mainDictonary["temp_max"] as? Double,
      let pressure = mainDictonary["pressure"] as? Double,
      let humidity = mainDictonary["humidity"] as? Double,
      let id = weatherDictonary["id"] as? Int,
      let wind = windDictonary["speed"] as? Double
    else{
      return nil
    }
    return Weather(temperature: temp, minTemperature: minTemp, maxTemperature: maxTemp, humidity: humidity, pressure: pressure, windSpeed: wind, conditionId: id, name: name)
    
  }
  
  static func fromData(data: Data) -> Weather? {
    let encoder = JSONDecoder()
    return try? encoder.decode(Weather.self, from: data)
  }
  
  func toData() -> Data?{
    let encoder = JSONEncoder()
    return try? encoder.encode(self)
  }
  
}

