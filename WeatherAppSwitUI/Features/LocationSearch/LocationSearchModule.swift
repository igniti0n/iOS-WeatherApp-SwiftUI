//
//  LocationSearchModule.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation
import UIKit
import SwiftUI

protocol LocationSearchRouterPresenter : RouterPresenterInterface {
  func goBackToHome()
}

protocol LocationSearchInteractorPresenter : InteractorPresenterInterface {
  func fetchWeatherDataForCity(cityName: String,onSuccess: @escaping ()->Void)
  func readCitiesFromStorage()
  func saveCitiesToStorage(cities: [String])
}

protocol LocationSearchPresenterRouter : PresenterRouterInterface {
  func goBackToHome()
}

protocol LocationSearchPresenterInteractor : PresenterInteractorInterface {
  func renderLoading()
  func renderContent(cities: [String])
  func renderError(error: Error)
  func goBackToHome()
}

protocol LocationSearchPresenterView:  PresenterViewInterface {
  func fetchWeatherDataForCity(cityName: String, searchedCities: [String]?)
  func readCitiesFromStorage()
}

class LocationSearchModule: ModuleInterface {
  typealias View = LocationSearchView
  typealias Presenter = LocationSearchPresenter
  typealias Router = LocationSearchRouter
  typealias Interactor = LocationSearchInteractor
  
  func build() -> UIViewController {
    let router = Router()
    let presenter = Presenter()
    let interactor = Interactor()
    let viewModel = LocationSearchViewModel()
    let view =  LocationSearchView(viewModel: viewModel, presenter: presenter).environmentObject(Theme())
    presenter.viewModel = viewModel
    assemble(presenter: presenter, router: router, interactor: interactor)
    let controller = UIHostingController(rootView: view)
    router.controller = controller
    return controller
  }
  
  
}
