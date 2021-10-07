//
//  UnitsSettings.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct UnitsSettings: View {
    @EnvironmentObject private var theme: Theme
    @EnvironmentObject var settings: WeatherSettingsViewModel
    
    var body: some View {
        VStack {
            HStack {
                CheckView(isChecked: $settings.settings.isCelsius, onTapped: {
                    settings.settings.changeMessurmentUnit()
                })
                Text("Celsius")
                Spacer()
            }
            HStack {
                CheckView(isChecked: $settings.settings.isFarenheit, onTapped: {
                    settings.settings.changeMessurmentUnit()
                })
                Text("Fahrenheit")
                Spacer()
            }
        }
        .font(theme.normalFont)
        .padding(20)
    }
}

struct UnitsSettings_Previews: PreviewProvider {
    static var previews: some View {
        UnitsSettings()
    }
}
