//
//  DetailRouter.swift
//  VIPER_SWIFTUI
//
//  Created by Ivan Stajcer on 09.10.2021..
//

import Foundation
import UIKit

class DetailRouter: RouterInterface {
    weak var presenter: DetailPresenterRouter!
    weak var rootRouter: RootRouter?
}

extension DetailRouter: DetailRouterPresenter {
    
}
