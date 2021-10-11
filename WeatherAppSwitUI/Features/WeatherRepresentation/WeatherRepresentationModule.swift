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
    func fetchWeatherForCity(cityName: String)
    func fetchWeatherForCurrentLocation(location: CLLocationCoordinate2D)
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
    
    // MARK:- Assembling everything
    func build() -> UIViewController {
        let presenter = Presenter()
        let router = Router()
        let interactor = Interactor()
        let viewModel = WeatherReperesentationViewModel()
        let settings = WeatherSettingsViewModel()
        var view = WeatherRepresentationView(viewModel: viewModel)
        presenter.viewModel = viewModel
        view.presenter = presenter
        print("Assembling home")
        assemble(presenter: presenter, router: router, interactor: interactor)
        let hostingController = UIHostingController(rootView: view.environmentObject(settings).environmentObject(Theme()))
        let navigationController = UINavigationController(rootViewController: hostingController)
        router.viewController = hostingController
        return navigationController
    }
    
}
