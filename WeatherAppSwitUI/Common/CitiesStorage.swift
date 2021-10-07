//
//  CitiesStorage.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import Foundation

class CitiesStorage {
    static func saveSearchedCitiesToUserDefaults(newCity: String) {
        var cities = readSearchedCitiesFromUserDefaults()
        if cities.contains(newCity) {
            return
        }
        cities.append(newCity)
        let defaults = UserDefaults.standard
        guard
        let encodedData = try? JSONEncoder().encode(cities)
        else {
            return
        }
        defaults.setValue(encodedData, forKey: "cities")
    }
    
   static func readSearchedCitiesFromUserDefaults()  -> Array<String>{
        let defaults = UserDefaults.standard
        guard
        let encodedData = defaults.data(forKey: "cities"),
        let savedCities = try? JSONDecoder().decode(Array<String>.self, from: encodedData)
        else {
            return []
        }
        return savedCities.sorted()
    }
}
