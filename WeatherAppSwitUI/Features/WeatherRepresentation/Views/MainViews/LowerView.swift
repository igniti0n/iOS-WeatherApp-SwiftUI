//
//  LowerView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import SwiftUI

struct LowerView: View {
    @ObservedObject var viewModel: WeatherReperesentationViewModel

    var body: some View {
        VStack(alignment: .center) {
            MinMaxView(minTemperature: $viewModel.weather.minTemperature, maxTemperature: $viewModel.weather.maxTemperature)
                .padding(40)
            Spacer()
            DetailsView(humidity: $viewModel.weather.humidity, pressure: $viewModel.weather.pressure, windSpeed: $viewModel.weather.windSpeed)
                .padding(40)
        }
    }
}

struct LowerView_Previews: PreviewProvider {
    static var previews: some View {
        Text("no no no no")//LowerView()
    }
}
