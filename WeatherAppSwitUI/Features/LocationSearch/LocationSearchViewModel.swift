//
//  LocationSearchViewModel.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation
import Combine

class LocationSearchViewModel: ObservableObject {
    @Published var searchedCities = [String]()
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        readSearchedCitiesFromUserDefaults()
        $searchedCities.sink {[weak self] storedCities in
            self?.saveSearchedCitiesToUserDefaults(cities: storedCities)
        }.store(in: &cancelables)
    }

}

private extension LocationSearchViewModel {
    func saveSearchedCitiesToUserDefaults(cities: [String]) {
        let defaults = UserDefaults.standard
        guard
        let encodedData = try? JSONEncoder().encode(cities)
        else {
            return
        }
        defaults.setValue(encodedData, forKey: "cities")
    }
    
    func readSearchedCitiesFromUserDefaults() {
        let defaults = UserDefaults.standard
        guard
        let encodedData = defaults.data(forKey: "cities"),
        let savedCities = try? JSONDecoder().decode(Array<String>.self, from: encodedData)
        else {
            return
        }
        searchedCities += savedCities.sorted()
    }
}
