//
//  WeatherSettingsRouter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation
import UIKit

class WeatherSettingsRouter: RouterInterface {
  weak var presenter: WeatherSettingsPresenterRouter!
  weak var controller: UIViewController!
}

extension WeatherSettingsRouter: WeatherSettingsRouterPresenter {
  
}
