//
//  WeatherSettingsModule.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation
import UIKit
import SwiftUI

protocol WeatherSettingsRouterPresenter: RouterPresenterInterface {
  
}

protocol WeatherSettingsInteractorPresenter: InteractorPresenterInterface {
  func readSettingsFromUserDefaults() -> Settings
  func saveSettingsToUserDefaults(settings: Settings)
}

protocol WeatherSettingsPresenterRouter: PresenterRouterInterface {
  
}

protocol WeatherSettingsPresenterInteractor: PresenterInteractorInterface {
}

protocol WeatherSettingsPresenterView: PresenterViewInterface {
  func getSettingsFromUserDefaults()
  func changeMessurmentUnit()
  func toggleHumidity()
  func togglePressure()
  func toggleWind()
}

class WeatherSettingsModule: ModuleInterface {
  typealias View = WeatherSettingsView
  typealias Presenter = WeatherSettingsPresenter
  typealias Router = WeatherSettingsRouter
  typealias Interactor = WeatherSettingsInteractor
  
  func build() -> UIViewController {
    let interactor = Interactor()
    let presenter  = Presenter()
    let router = Router()
    let viewModel = WeatherSettingsViewModel()
    let view = View(viewModel: viewModel, presenter: presenter)
    presenter.viewModel = viewModel
    assemble(presenter: presenter, router: router, interactor: interactor)
    let controller = UIHostingController(rootView: view.environmentObject(Theme()))
    router.controller = controller
    return controller
  }
}

