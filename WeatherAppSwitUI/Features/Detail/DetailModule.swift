//
//  DetailModule.swift
//  VIPER_SWIFTUI
//
//  Created by Ivan Stajcer on 09.10.2021..
//

import Foundation
import UIKit
import SwiftUI

public protocol DetailInteractorPresenter: InteractorPresenterInterface {
    
}

public protocol DetailPresenterInteractor: PresenterInteractorInterface {
    
}

public protocol DetailPresenterRouter: PresenterRouterInterface {
    
}

public protocol DetailPresenterView: PresenterViewInterface {
    func authenticate()
}

public protocol DetailRouterPresenter: RouterPresenterInterface {
    
}


class DetailModule: ModuleInterface {
    typealias View = DetailView
    typealias Presenter = DetailPresenter
    typealias Router = DetailRouter
    typealias Interactor = DetailInteractor
    
  func build(rootRouter: RootRouter) -> UIViewController {
        let presenter = DetailPresenter()
        let router = Router()
        let interactor = DetailInteractor()
        let viewModel = DetailViewState()
        presenter.viewModel = viewModel
        assemble(presenter: presenter, router: router, interactor: interactor)
        let view = DetailView(presenter: presenter, viewState: viewModel)
        let controller = UIHostingController(rootView: view)
        router.rootRouter = rootRouter
        return controller
    }
    
}
