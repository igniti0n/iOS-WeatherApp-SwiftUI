//
//  DetailsSettings.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct DetailsSettings: View {
    @EnvironmentObject private var theme: Theme
    var settings: Settings
    var presenter: WeatherSettingsPresenterView!
    
    var body: some View {
        HStack(spacing: 30) {
            Spacer()
            VStack {
                Image("humidity")
                CheckView(isChecked: settings.showHumidity) {
                    presenter.toggleHumidity()
                }
            }
            Spacer()
            VStack {
                Image("pressure")
                CheckView(isChecked: settings.showPressure) {
                    presenter.togglePressure()
                }
            }
            Spacer()
            VStack {
                Image("wind")
                CheckView(isChecked: settings.showWind) {
                    presenter.toggleWind()
                }
            }
            Spacer()
        }
    }
}

struct DetailsSettings_Previews: PreviewProvider {
    static var previews: some View {
        Text("no")//DetailsSettings()
    }
}
