//
//  LocationSearchViewModel.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation
import Combine

enum LocationSearchState {
    case loading
    case loaded([String])
}

class LocationSearchViewModel: ObservableObject {
    @Published var state: LocationSearchState = .loading
    @Published var hasError: Bool = false
}
