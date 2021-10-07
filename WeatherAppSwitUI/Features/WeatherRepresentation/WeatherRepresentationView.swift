//
//  WeatherRepresentationView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherRepresentationView: View {
    @ObservedObject private var viewModel: WeatherReperesentationViewModel

    init(viewModel: WeatherReperesentationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            BackgroundView {
                GeometryReader { ctx in
                    VStack {
                        UpperView(viewModel: viewModel)
                            .frame(height: ctx.size.height / 2, alignment: .center)
                            .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                        LowerView(viewModel: viewModel)
                        .frame(width: ctx.size.width, height: ctx.size.height / 2, alignment: .center)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}



struct WeatherRepresentationView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRepresentationView(viewModel: WeatherReperesentationViewModel())
    }
}
