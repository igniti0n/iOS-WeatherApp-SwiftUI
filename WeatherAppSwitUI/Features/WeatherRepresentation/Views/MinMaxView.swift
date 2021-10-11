//
//  MinMaxView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct MinMaxView: View {
    @EnvironmentObject private var theme: Theme
    @EnvironmentObject private var settings: WeatherSettingsViewModel
    var minTemperature: Double
    var maxTemperature: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            VStack {
                Text("min")
                Text("\(UnitConverter.adjustMessurmentUnit(temperature: minTemperature, isCelsius: settings.settings.isCelsius), specifier: "%.2f")\(settings.settings.messurmentUnit)")
            }
            Spacer()
            VStack {
                Text("max")
                Text("\(UnitConverter.adjustMessurmentUnit(temperature: maxTemperature, isCelsius: settings.settings.isCelsius), specifier: "%.2f")\(settings.settings.messurmentUnit)")
            }
            Spacer()
        }
        .font(theme.normalFont)
    }
}

struct MinMaxView_Previews: PreviewProvider {
    static var previews: some View {
        Text("lol bas cu sad pravit bidning.")//MinMaxView(minTemperature: <#T##Binding<Double>#>, maxTemperature: <#T##Binding<Double>#>)
    }
}
