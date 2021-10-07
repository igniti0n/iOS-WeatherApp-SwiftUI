//
//  WeatherSettingsView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherSettingsView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject private var viewModel: WeatherSettingsViewModel
    
    init(viewModel: WeatherSettingsViewModel) {
        self.viewModel = viewModel
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
    }
}

struct WeatherSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSettingsView(viewModel: WeatherSettingsViewModel())
    }
}
