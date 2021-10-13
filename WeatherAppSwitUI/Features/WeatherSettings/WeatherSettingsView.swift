//
//  WeatherSettingsView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherSettingsView: View, ViewInterface {
  @ObservedObject private var viewModel: WeatherSettingsViewModel
  var presenter: WeatherSettingsPresenterView!
  
  init(viewModel: WeatherSettingsViewModel, presenter: WeatherSettingsPresenterView) {
    self.viewModel = viewModel
    self.presenter = presenter
    NavigationBarStyle.apply()
  }
  
  var body: some View {
    BackgroundView {
      VStack(alignment: .leading, spacing: 20) {
        Spacer()
        UnitsSettings(settings: viewModel.settings, presenter: presenter)
        DetailsSettings(settings: viewModel.settings, presenter: presenter)
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
