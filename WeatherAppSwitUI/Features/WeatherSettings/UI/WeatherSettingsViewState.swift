//
//  WeatherSettingsViewModel.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import Foundation
import Combine

class WeatherSettingsViewState: ObservableObject {
  @Published var settings: Settings = Settings.defaultSettings()
}

