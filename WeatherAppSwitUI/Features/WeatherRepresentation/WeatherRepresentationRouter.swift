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
  weak var rootRouter: RootRouter?
}

// MARK: - Navigation
extension WeatherRepresentationRouter: WeatherRepresentationRouterPresenter {
  func navigateToSearch(viewModel: LocationSearchViewState) {
    if let router = rootRouter {
      rootRouter?.push(LocationSearchModule().build(rootRouter: router), animated: true) {
        print("Search completed!")
      }
    }
  }
  
  func navigateToSettings(viewModel: WeatherSettingsViewState) {
    if let router = rootRouter {
      rootRouter?.push(WeatherSettingsModule().build(rootRouter: router), animated: true, completion: nil)
    }
  }
}
