//
//  OnboardingModule.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 19.10.2021..
//

import Foundation
import UIKit
import SwiftUI

class OnboardingModule {
  func build(rootRouter: RootRouter) -> UIViewController {
    let router = OnboardingRouter(rootRouter: rootRouter)
    let view = OnboardingView(router: router)
    let controller = UIHostingController(rootView: view)
    return controller
  }
}


