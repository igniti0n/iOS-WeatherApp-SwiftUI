//
//  Interfaces.swift
//  VIPER
//
//  Created by Tibor Bödecs on 2019. 05. 16..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import Foundation

// MARK: - VIPER
public protocol ViewInterface/*: ViewPresenterInterface*/ {
    associatedtype PresenterView
    
    var presenter: PresenterView! { get set }
}

public protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor
    
    var presenter: PresenterInteractor! { get set }
}

public protocol PresenterInterface: PresenterRouterInterface & PresenterInteractorInterface & PresenterViewInterface {
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    
    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
}

public protocol EntityInterface {}

public protocol RouterInterface: RouterPresenterInterface {
    associatedtype PresenterRouter

    var presenter: PresenterRouter! { get set }
}

// MARK: - "i/o" transitions
public protocol RouterPresenterInterface: AnyObject {
    
}

public protocol InteractorPresenterInterface: AnyObject {
    
}

public protocol PresenterRouterInterface: AnyObject {
    
}

public protocol PresenterInteractorInterface: AnyObject {
    
}

public protocol PresenterViewInterface: AnyObject {
    
}

// MARK: - module

public protocol ModuleInterface {

    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    associatedtype Interactor where Interactor: InteractorInterface
    
    func assemble(presenter: Presenter, router: Router, interactor: Interactor)
}

public extension ModuleInterface {

    func assemble(presenter: Presenter, router: Router, interactor: Interactor) {
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}

