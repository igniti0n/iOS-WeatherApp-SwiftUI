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
    //func fetchWeatherForCity(cityName: String)
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
    func getCurrentWeatherSettings()
    func getCurrentWeather()

}

protocol WeatherRepresentationRouterPresenter: RouterPresenterInterface {
    func navigateToSearch(viewModel: LocationSearchViewModel)
    func navigateToSettings(viewModel: WeatherSettingsViewModel)
}

class WeatherRepresentationModule: ModuleInterface {
    typealias View = WeatherRepresentationView
    typealias Presenter = WeatherRepresentationPresenter
    typealias Router = WeatherRepresentationRouter
    typealias Interactor = WeatherRepresentationInteractor
    
    init() {
        WeatherStorage.deleteWeatherFromUserDefaults()
    }
    
    // MARK:- Assembling everything
    func build() -> UIViewController {
        let presenter = Presenter()
        let router = Router()
        let interactor = Interactor()
        let viewModel = WeatherReperesentationViewModel()
        let view = WeatherRepresentationView(viewModel: viewModel, presenter: presenter)
        presenter.viewModel = viewModel
        assemble(presenter: presenter, router: router, interactor: interactor)
        let hostingController = UIHostingController(rootView: view.navigationBarHidden(true))
        let navigationController = UINavigationController(rootViewController: hostingController)
        hostingController.navigationItem.title = ""
        router.viewController = hostingController
        return navigationController
    }
    
}
