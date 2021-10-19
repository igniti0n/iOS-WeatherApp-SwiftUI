//
//  ContentView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import SwiftUI

struct WeatherRepresentationContentView: View {
  var weather: Weather!
  var presenter: WeatherRepresentationPresenterView!
  
  var body: some View {
    GeometryReader { ctx in
      VStack {
        UpperView(onSearchButtonPressed: {
          presenter.navigateToSearch()
        }, onSettingsButtonPressed: {
          presenter.navigateToSettings()
        },onSignOutButtonPressed: {
          presenter.signOut()
        },
        weather: weather)
        .frame(height: ctx.size.height / 2, alignment: .center)
        .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
        LowerView(weather: weather)
          .frame(width: ctx.size.width, height: ctx.size.height / 2, alignment: .center)
      }
    }
  }
}

struct WeatherRepresentationContentView_Previews: PreviewProvider {
  static var previews: some View {
    Text("")// ContentView()
  }
}
