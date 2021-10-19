//
//  LocationSearchView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct LocationSearchView: View, ViewInterface {
  @ObservedObject private var viewState: LocationSearchViewState
  var presenter: LocationSearchPresenterView!
  
  init(viewState: LocationSearchViewState, presenter: LocationSearchPresenterView) {
    self.viewState = viewState
    self.presenter = presenter
    NavigationBarStyle.apply()
  }
  
  var body: some View {
    BackgroundView {
      switch viewState.state {
      case .loading:
        Text("Loading...")
      case .loaded(let cities):
        LocationSearchContentView(cities: cities, presenter: presenter)
      }
    }
    .environmentObject(Theme())
    .onAppear() {
      presenter.readCitiesFromStorage()
    }
    .alert(isPresented: $viewState.hasError) {
      Alert(title: Text( "Operation failed."), message: Text("Failed to retrieve data for searched city."), dismissButton: .some(.cancel(Text("Okay."))))
    }
  }
  
  struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
      LocationSearchView(viewState: LocationSearchViewState(), presenter: LocationSearchPresenter.init())
    }
  }
}
