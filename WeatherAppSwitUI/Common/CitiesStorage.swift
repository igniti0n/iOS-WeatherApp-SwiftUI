//
//  CitiesStorage.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import Foundation

class CitiesStorage {
    static let CITIES_KEY = "cities"

    static func saveSearchedCitiesToUserDefaults(newCities: [String]) {
        let defaults = UserDefaults.standard
        guard
        let encodedData = try? JSONEncoder().encode(newCities)
        else {
            return
        }
        defaults.setValue(encodedData, forKey: CITIES_KEY)
    }
    
   static func readSearchedCitiesFromUserDefaults()  -> Array<String>{
        let defaults = UserDefaults.standard
        guard
        let encodedData = defaults.data(forKey: CITIES_KEY),
        let savedCities = try? JSONDecoder().decode(Array<String>.self, from: encodedData)
        else {
            return []
        }
        return savedCities.sorted()
    }
}
