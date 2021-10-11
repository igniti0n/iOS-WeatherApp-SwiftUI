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
    var viewController: UIViewController?
}

extension WeatherRepresentationRouter: WeatherRepresentationRouterPresenter {
    // MARK: - Navigation
    func navigateToSearch(viewModel: LocationSearchViewModel) {
        let controller = UIHostingController(rootView: LocationSearchView(viewModel: viewModel))
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
    func navigateToSettings(viewModel: WeatherSettingsViewModel) {
        let controller = UIHostingController(rootView: WeatherSettingsView(viewModel: viewModel))
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
