//
//  OnobardingView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 19.10.2021..
//

import SwiftUI

struct OnboardingView: View {
  var router: OnboardingRouter!
  
    var body: some View {
      VStack {
        Text("Onboarding")
        Button("Finish") {
          router.finishOnobarding()
        }
      }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Text("geheh")//OnobardingView()
    }
}
