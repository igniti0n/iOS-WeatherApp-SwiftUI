//
//  WeatherRepresentationModule.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 10.10.2021..
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

protocol WeatherRepresentationInteractorPresenter: InteractorPresenterInterface {
  func fetchWeatherForCurrentLocation(location: CLLocationCoordinate2D)
  func getCurrentWeatherSettings() -> Settings
  func getCurrentWeather()
  
}

protocol WeatherRepresentationPresenterInteractor: PresenterInteractorInterface {
  func renderLoading()
  func renderContent(weather: Weather)
  func renderError(error: Error)
}

protocol WeatherRepresentationPresenterRouter: PresenterRouterInterface {
  
}

protocol WeatherRepresentationPresenterView: PresenterViewInterface {
  func navigateToSearch()
  func navigateToSettings()
  func signOut()
  func getCurrentWeatherSettings()
  func getCurrentWeather()
  
}

protocol WeatherRepresentationRouterPresenter: RouterPresenterInterface {
  func navigateToSearch(viewModel: LocationSearchViewState)
  func navigateToSettings(viewModel: WeatherSettingsViewState)
}

class WeatherRepresentationModule: ModuleInterface {
  typealias View = WeatherRepresentationView
  typealias Presenter = WeatherRepresentationPresenter
  typealias Router = WeatherRepresentationRouter
  typealias Interactor = WeatherRepresentationInteractor
  
  init() {
  }
  // MARK:- Assembling everything
  func build(rootRouter: RootRouter?) -> UIViewController {
    let presenter = Presenter()
    let router = Router()
    let interactor = Interactor()
    let viewModel = WeatherReperesentationViewState()
    let view = WeatherRepresentationView(viewState: viewModel, presenter: presenter)
    presenter.viewModel = viewModel
    assemble(presenter: presenter, router: router, interactor: interactor)
    let hostingController = UIHostingController(rootView: view.navigationBarHidden(true))
    hostingController.navigationItem.title = ""
    router.rootRouter = rootRouter
    return hostingController
  }
  
}
