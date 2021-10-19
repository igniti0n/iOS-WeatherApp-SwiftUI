//
//  UnitsSettings.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct UnitsSettings: View {
  var settings: Settings
  var presenter: WeatherSettingsPresenterView!
  @EnvironmentObject private var theme: Theme

  
  var body: some View {
    VStack {
      HStack {
        CheckView(isChecked: settings.isCelsius, onTapped: {
          presenter.changeMessurmentUnit()
        })
        Text("Celsius")
        Spacer()
      }
      HStack {
        CheckView(isChecked: settings.isFarenheit, onTapped: {
          presenter.changeMessurmentUnit()
        })
        Text("Fahrenheit")
        Spacer()
      }
    }
    .font(theme.normalFont)
    .padding(20)
  }
}

struct UnitsSettings_Previews: PreviewProvider {
  static var previews: some View {
    Text("no way")//UnitsSettings()
  }
}
