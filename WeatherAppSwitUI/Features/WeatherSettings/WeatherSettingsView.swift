//
//  WeatherSettingsView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherSettingsView: View, ViewInterface {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
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
                UnitsSettings()
                DetailsSettings()
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
