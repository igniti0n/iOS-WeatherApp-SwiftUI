//
//  DetailsView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct DetailsView: View {
    @EnvironmentObject private var theme: Theme
    @EnvironmentObject private var settings: WeatherSettingsViewModel
    @Binding var humidity: Double
    @Binding var pressure: Double
    @Binding var windSpeed: Double
    
    var body: some View {
        HStack(alignment: .center) {
            if settings.settings.showHumidity {
                VStack {
                    Text("Humidity")
                    Text("\(humidity,specifier: "%.0f") %")
                }
            }
            if settings.settings.showPressure {
                VStack {
                    Text("Pressure")
                    Text("\(pressure,specifier: "%.1f") hpa")
                }
            }
            if settings.settings.showWind {
                VStack {
                    Text("Wind")
                    Text("\(windSpeed,specifier: "%.1f") mph")
                }
            }
        }
        .font(theme.normalFont)
        .foregroundColor(Color.white)
        .scaledToFit()
        .minimumScaleFactor(0.5)
        .lineLimit(1)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("no way, no no.")//DetailsView()
    }
}
