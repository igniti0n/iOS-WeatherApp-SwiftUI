//
//  TopButtonsView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct TopButtonsView: View {
  let onSearchButtonPressed: (()->Void)?
  let onSettingsButtonPressed: (()->Void)?
  let onSignOutButtonPressed: (()->Void)?
  @EnvironmentObject private var theme: Theme
  
  let conditionId = 800
  
  var conditionName: String {
    switch conditionId { case 200...232:
      return "cloud.bolt" case 300...321:
        return "cloud.drizzle" case 500...531:
          return "cloud.rain" case 600...622:
            return "cloud.snow" case 701...781:
              return "cloud.fog" case 800:
                return "sun.max" case 801...804:
                  return "cloud.bolt" default:
                    return "cloud" }
  }
  
  var body: some View {
    HStack(spacing: 20) {
      Image("search")
        .resizable()
        .scaledToFit()
        .frame(width: 44, height: 44, alignment: .center)
        .onTapGesture {
          onSearchButtonPressed?()
        }
      Image("settings")
        .resizable()
        .scaledToFit()
        .frame(width: 44, height: 44, alignment: .center)
        .onTapGesture {
          onSettingsButtonPressed?()
        }
      Button("SignOut") {
       onSignOutButtonPressed?()
      }
      Spacer()
      Image(systemName: conditionName)
        .resizable()
        .scaledToFit()
        .padding(10)
    }
  }
}

struct TopButtonsView_Previews: PreviewProvider {
  static var previews: some View {
    Text("he he he he")// TopButtonsView()
  }
}
