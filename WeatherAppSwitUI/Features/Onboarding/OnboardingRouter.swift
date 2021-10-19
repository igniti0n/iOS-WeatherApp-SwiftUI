//
//  OnboardingRouter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 19.10.2021..
//

import Foundation

class OnboardingRouter {
  weak var rootRouter: RootRouter!
  
  init(rootRouter: RootRouter) {
    self.rootRouter = rootRouter
  }
}

// MARK: - Navigation
extension OnboardingRouter {
  func finishOnobarding() {
    AppStateProvider.instance.finishOnboarding()
  }
}
