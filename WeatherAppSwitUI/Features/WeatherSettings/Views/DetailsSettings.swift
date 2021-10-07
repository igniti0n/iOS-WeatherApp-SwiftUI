//
//  DetailsSettings.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct DetailsSettings: View {
    @EnvironmentObject private var theme: Theme
    @EnvironmentObject var settings: WeatherSettingsViewModel

    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            VStack {
                Image("humidity")
                CheckView(isChecked: $settings.settings.showHumidity) {
                    settings.settings.showHumidity.toggle()
                }
            }
            Spacer()
            VStack {
                Image("pressure")
                CheckView(isChecked: $settings.settings.showPressure) {
                    settings.settings.showPressure.toggle()
                }
            }
            Spacer()
            VStack {
                Image("wind")
                CheckView(isChecked: $settings.settings.showWind) {
                    settings.settings.showWind.toggle()
                }
            }
            Spacer()
        }
    }
}

struct DetailsSettings_Previews: PreviewProvider {
    static var previews: some View {
        DetailsSettings()
    }
}
