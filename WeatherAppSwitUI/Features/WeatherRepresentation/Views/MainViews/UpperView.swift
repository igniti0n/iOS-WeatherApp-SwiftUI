//
//  UpperView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import SwiftUI

struct UpperView: View {
    @ObservedObject var viewModel: WeatherReperesentationViewModel

    var body: some View {
        GeometryReader { innerContext in
            VStack(alignment: .leading) {
                TopButtonsView(onCitySearch: { city in
                    viewModel.fetchWeatherDataCityName(cityName: city)
                })
                    .frame(height: innerContext.size.height / 2.5, alignment: .center)
                TemperatureView(temperature: $viewModel.weather.temperature, cityName: $viewModel.weather.name)
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
