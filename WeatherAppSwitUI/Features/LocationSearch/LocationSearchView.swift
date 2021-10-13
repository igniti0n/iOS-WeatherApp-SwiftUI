//
//  LocationSearchView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct LocationSearchView: View, ViewInterface {
  @ObservedObject private var viewModel: LocationSearchViewModel
  var presenter: LocationSearchPresenterView!
  
  init(viewModel: LocationSearchViewModel, presenter: LocationSearchPresenterView) {
    self.viewModel = viewModel
    self.presenter = presenter
    NavigationBarStyle.apply()
  }
  
  var body: some View {
    BackgroundView {
      switch viewModel.state {
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
    .alert(isPresented: $viewModel.hasError) {
      Alert(title: Text( "Operation failed."), message: Text("Failed to retrieve data for searched city."), dismissButton: .some(.cancel(Text("Okay."))))
    }
  }
  
  struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
      LocationSearchView(viewModel: LocationSearchViewModel(), presenter: LocationSearchPresenter.init())
    }
  }
}
