//
//  BackgroundView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct BackgroundView<Content: View>: View {
  let content: () -> Content
  
  init(@ViewBuilder content: @escaping ()->Content) {
    self.content = content
  }
  
  var body: some View {
    ZStack(alignment: .center) {
      Image("background")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .ignoresSafeArea()
      GeometryReader { geo in
        content()
          .frame(width: geo.size.width, height: geo.size.height)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    Text("lol")
  }
}
