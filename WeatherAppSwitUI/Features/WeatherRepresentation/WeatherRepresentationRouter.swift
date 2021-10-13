//
//  WeatherRepresentationRouter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 10.10.2021..
//

import Foundation
import UIKit
import SwiftUI

class WeatherRepresentationRouter: RouterInterface {
  weak var presenter: WeatherRepresentationPresenterRouter!
  weak var viewController: UIViewController?
}

extension WeatherRepresentationRouter: WeatherRepresentationRouterPresenter {
  // MARK: - Navigation
  func navigateToSearch(viewModel: LocationSearchViewModel) {
    viewController?.navigationController?.pushViewController(LocationSearchModule().build(), animated: true)
  }
  func navigateToSettings(viewModel: WeatherSettingsViewModel) {
    viewController?.navigationController?.pushViewController(WeatherSettingsModule().build(), animated: true)
  }
}
