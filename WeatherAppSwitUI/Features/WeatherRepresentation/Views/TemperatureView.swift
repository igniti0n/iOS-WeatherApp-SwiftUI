//
//  TemperatureView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct TemperatureView: View {
    @EnvironmentObject private var theme: Theme
    @EnvironmentObject private var settings: WeatherSettingsViewModel
    @Binding  var temperature: Double
    @Binding  var cityName: String
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(UnitConverter.adjustMessurmentUnit(temperature: temperature, isCelsius: settings.settings.isCelsius), specifier: "%.2f") C")
                    .font(theme.largeFont)
                    .bold()
                Text("\(cityName)")
                    .font(theme.normalFont)
            }
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .lineLimit(1)
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        Text("lool")// TemperatureView()
    }
}
