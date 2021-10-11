//
//  UpperView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import SwiftUI

struct UpperView: View {
    let onSearchButtonPressed: (()->Void)?
    let onSettingsButtonPressed: (()->Void)?
    var weather: Weather
    
    
    var body: some View {
        GeometryReader { innerContext in
            VStack(alignment: .leading) {
                TopButtonsView(onSearchButtonPressed: onSearchButtonPressed, onSettingsButtonPressed: onSettingsButtonPressed)
                    .frame(height: innerContext.size.height / 2.5, alignment: .center)
                TemperatureView(temperature: weather.temperature, cityName: weather.name)
                Spacer()
            }
        }
    }
}

struct UpperView_Previews: PreviewProvider {
    static var previews: some View {
        Text("nope.")// UpperView()
    }
}
