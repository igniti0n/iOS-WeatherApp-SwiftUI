//
//  WeatherSettingsView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherSettingsView: View, ViewInterface {
  @ObservedObject private var viewState: WeatherSettingsViewState
  var presenter: WeatherSettingsPresenterView!
  
  init(viewState: WeatherSettingsViewState, presenter: WeatherSettingsPresenterView) {
    self.viewState = viewState
    self.presenter = presenter
    NavigationBarStyle.apply()
  }
  
  var body: some View {
    BackgroundView {
      VStack(alignment: .leading, spacing: 20) {
        Spacer()
        UnitsSettings(settings: viewState.settings, presenter: presenter)
        DetailsSettings(settings: viewState.settings, presenter: presenter)
        Spacer()
      }
    }
    .environmentObject(Theme())
    .onAppear() {
      presenter.getSettingsFromUserDefaults()
    }
  }
}

struct WeatherSettingsView_Previews: PreviewProvider {
  static var previews: some View {
    Text("")//WeatherSettingsView(viewModel: WeatherSettingsViewModel())
  }
}
