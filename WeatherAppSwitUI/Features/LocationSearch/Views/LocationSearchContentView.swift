//
//  ContentView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import SwiftUI

struct LocationSearchContentView: View {
  var cities: [String]!
  var presenter: LocationSearchPresenterView!
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      SearchView { cityName  in
        presenter.fetchWeatherDataForCity(cityName: cityName, searchedCities: cities)
      }
      SearchedCitiesView(cities: cities) { cityName in
        presenter.fetchWeatherDataForCity(cityName: cityName, searchedCities: nil)
      }
    }
    .padding(EdgeInsets(top: 40, leading: 40, bottom: 0, trailing: 40))
  }
}


struct LocationSearchContentViewContentView_Previews: PreviewProvider {
  static var previews: some View {
    Text("")// ContentView()
  }
}
