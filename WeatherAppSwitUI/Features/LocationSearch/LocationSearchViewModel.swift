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
//        $searchedCities.sink {[weak self] storedCities in
//            self?.saveSearchedCitiesToUserDefaults(cities: storedCities)
//        }.store(in: &cancelables)
    }

}

private extension LocationSearchViewModel {
    func readSearchedCitiesFromUserDefaults() {
       searchedCities = CitiesStorage.readSearchedCitiesFromUserDefaults()
    }
}
