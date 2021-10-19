//
//  RootCoordainator.swift
//  BezvezeSwiftUIEksperimentiranje
//
//  Created by Ivan Stajcer on 13.10.2021..
//

import Foundation
import UIKit
import Combine

class AppCoordinator: Coordinator {
  var cancellable = Set<AnyCancellable>()
  
  let appStateProvider: AppStateProvider!
  let rootController = UINavigationController()
  let rootRouter: RootRouter!
 
  init() {
    appStateProvider = AppStateProvider.instance
    rootRouter = RootRouter(rootController: rootController)
    listenToAppStateChanges()
  }
  
  func start() -> UIViewController {
    reloadFlow(currentAppState: appStateProvider.subject.value)
    return rootController
  }
}

// MARK: - Private functions
private extension AppCoordinator {
  func reloadFlow(currentAppState: AppState) {
    switch currentAppState {
    case .userAuthenticated(_):
      showMainFlow()
    case .userNotAuthenitcated:
     showAuthenticationFlow()
    case .onboarding:
      showOnboarding()
    }
  }
  
  func listenToAppStateChanges() {
    AppStateProvider.instance.subject
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          print("error \(error)")
        case .finished:
          print("Finished succesfuly!")
        }
      } receiveValue: { [weak self] newAppState in
        print("App state :::: \(newAppState) ::::")
        self?.reloadFlow(currentAppState: newAppState)
      }.store(in: &cancellable)
  }
}

// MARK: - Navigation
private extension AppCoordinator {
  func showMainFlow() {
    let module = WeatherRepresentationModule()
    rootRouter.setRootModule(module.build(rootRouter: rootRouter), hideBar: true)
  }
  
  func showAuthenticationFlow() {
    let module = DetailModule()
    rootRouter.setRootModule(module.build(rootRouter: rootRouter), hideBar: true)
  }
  
  func showOnboarding() {
    let module = OnboardingModule()
    rootRouter.setRootModule(module.build(rootRouter: rootRouter), hideBar: true)
  }
}
