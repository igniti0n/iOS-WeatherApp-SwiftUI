//
//  WeatherRepresentationView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherRepresentationView: View {
    @ObservedObject private var viewModel: WeatherReperesentationViewModel

    init(viewModel: WeatherReperesentationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            BackgroundView {
                GeometryReader { ctx in
                    VStack {
                        GeometryReader { innerContext in
                            VStack(alignment: .leading) {
                                TopButtonsView(onCitySearch: { city in
                                    viewModel.fetchWeatherDataCityName(cityName: city)
                                })
                                    .frame(height: innerContext.size.height / 2.5, alignment: .center)
                                TemperatureView(temperature: $viewModel.weather.temperature, cityName: $viewModel.weather.name)
                                Spacer()
                            }
                            .frame(height: ctx.size.height / 2, alignment: .center)
                            .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                        }
                        VStack(alignment: .center) {
                            MinMaxView(minTemperature: $viewModel.weather.minTemperature, maxTemperature: $viewModel.weather.maxTemperature)
                                .padding(40)
                            Spacer()
                            DetailsView(humidity: $viewModel.weather.humidity, pressure: $viewModel.weather.pressure, windSpeed: $viewModel.weather.windSpeed)
                                .padding(40)
                        }
                        .frame(width: ctx.size.width, height: ctx.size.height / 2, alignment: .center)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct WeatherRepresentationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRepresentationView(viewModel: WeatherReperesentationViewModel())
    }
}
