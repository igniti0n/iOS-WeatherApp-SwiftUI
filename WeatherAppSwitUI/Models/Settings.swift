//
//  Settings.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation

struct Settings: Codable {
    var isCelsius: Bool
    var isFarenheit: Bool
    var showHumidity: Bool
    var showPressure: Bool
    var showWind: Bool
    
    var messurmentUnit: String {
        isCelsius ? " °C" : " °F"
    }
    
   mutating func changeMessurmentUnit() {
        isCelsius.toggle()
        isFarenheit.toggle()
    }
    
    static func defaultSettings() -> Settings {
        Settings(
            isCelsius: true,
            isFarenheit: false,
            showHumidity: true,
            showPressure: true,
            showWind: true
        )
    }
    
    static func fromData(data: Data) -> Settings? {
        let encoder = JSONDecoder()
        return try? encoder.decode(Settings.self, from: data)
    }
    
    func toData() -> Data?{
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
}

