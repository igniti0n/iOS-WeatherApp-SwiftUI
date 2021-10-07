//
//  UnitConverter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation

final class UnitConverter {
    static func adjustMessurmentUnit(temperature: Double, isCelsius: Bool) -> Double {
        let shouldChangeToCelsius = isCelsius && temperature > 100
        let shouldChangeToFahrenheit = !isCelsius && temperature < 100
        if shouldChangeToCelsius {
            return fahrenheitToCelsius(fahrenheit: temperature)
        }else if shouldChangeToFahrenheit {
            return celsiusToFahrenheit(celsius: temperature)
        }
        return temperature
    }
}

private extension UnitConverter {
    static func fahrenheitToCelsius(fahrenheit: Double) -> Double {
        let celsius = (fahrenheit - 273.15)
        return round(celsius * 100)/100
    }
    static func celsiusToFahrenheit(celsius: Double) -> Double {
        let fahrenheit = (celsius + 273.15)
        return round(fahrenheit * 100)/100
    }
}
