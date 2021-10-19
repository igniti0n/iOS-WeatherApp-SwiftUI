//
//  LocationSearchRouter.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 12.10.2021..
//

import Foundation
import SwiftUI
import UIKit

class LocationSearchRouter: RouterInterface {
  weak var presenter: LocationSearchPresenterRouter!
  weak var rootRouter: RootRouter?
}

extension LocationSearchRouter: LocationSearchRouterPresenter {
  func goBackToHome() {
    rootRouter?.push(UIHostingController(rootView: DummyView(rootRouter: rootRouter)), animated: true, completion: {
      print("Detail completed!")
    })
    //rootRouter?.popModule(animated: true)
  }
}

struct DummyView: View {
  var rootRouter: RootRouter!

  var body: some View {
    VStack {
      Text("pop to root hehe.")
      Button("Pop it.") {
        rootRouter.popToRootModule(animated: true)
      }
    }.background( Color.red)
  }
}
