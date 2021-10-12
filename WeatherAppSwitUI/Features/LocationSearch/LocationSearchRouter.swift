//
//  LocationSearchRouter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation
import UIKit

class LocationSearchRouter: RouterInterface {
    weak var presenter: LocationSearchPresenterRouter!
    weak var controller: UIViewController!
}

extension LocationSearchRouter: LocationSearchRouterPresenter {
    func goBackToHome() {
        controller.navigationController?.popViewController(animated: true)
    }
}
