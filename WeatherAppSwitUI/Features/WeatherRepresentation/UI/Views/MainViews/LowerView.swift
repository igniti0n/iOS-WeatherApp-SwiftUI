//
//  LowerView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import SwiftUI

struct LowerView: View {
  var weather: Weather
  
  var body: some View {
    VStack(alignment: .center) {
      MinMaxView(minTemperature: weather.minTemperature, maxTemperature: weather.maxTemperature)
        .padding(40)
      Spacer()
      DetailsView(humidity: weather.humidity, pressure: weather.pressure, windSpeed: weather.windSpeed)
        .padding(40)
    }
  }
}

struct LowerView_Previews: PreviewProvider {
  static var previews: some View {
    Text("no no no no")//LowerView()
  }
}
