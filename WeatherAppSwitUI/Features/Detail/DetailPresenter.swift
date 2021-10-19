//
//  DetailPresenter.swift
//  VIPER_SWIFTUI
//
//  Created by Ivan Stajcer on 09.10.2021..
//

import Foundation

class DetailPresenter: PresenterInterface {
    var interactor: DetailInteractorPresenter!
    var router: DetailRouterPresenter!
    weak var viewModel: DetailViewState!
}

extension DetailPresenter: DetailPresenterInteractor {
    
}

extension DetailPresenter: DetailPresenterRouter {
    
}

extension DetailPresenter: DetailPresenterView {
  func authenticate() {
    AppStateProvider.instance.authenticate()
  }
}
