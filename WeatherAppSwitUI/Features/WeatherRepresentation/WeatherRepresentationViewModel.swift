//
//  WeatherRepresentationViewModel.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation
import CoreLocation
import Combine

enum WeatherRepresentationState {
    case loading
    case loaded(Weather)
    case error(Error)
}

class WeatherReperesentationViewModel: ObservableObject {
    @Published var weatherState: WeatherRepresentationState = .loading
    @Published var settings = WeatherSettingsViewModel()
    @Published var isErrorAlertShown = false
    var errorMessage = "Error while fetching data."
}

