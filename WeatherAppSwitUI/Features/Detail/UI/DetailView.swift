//
//  DetailView.swift
//  VIPER_SWIFTUI
//
//  Created by Ivan Stajcer on 09.10.2021..
//

import SwiftUI

struct DetailView: View, ViewInterface {    
    var presenter: DetailPresenterView!
    var viewState: DetailViewState
    
    var body: some View {
//      TabView(
      VStack {
        Text("Hello, World!")
        Button("Authenticate.") {
          presenter.authenticate()
        }
      }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(presenter: DetailPresenter(), viewState: DetailViewState())
    }
}
