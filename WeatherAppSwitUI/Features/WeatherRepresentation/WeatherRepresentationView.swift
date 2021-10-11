//
//  WeatherRepresentationView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct WeatherRepresentationView: View, ViewInterface {
    @ObservedObject private var viewModel: WeatherReperesentationViewModel
    var presenter: WeatherRepresentationPresenterView!
    
    init(viewModel: WeatherReperesentationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            BackgroundView {
                switch viewModel.weatherState {
                    case .loading:
                        Text("Loading")
                    case .error(let error):
                        Text("error \(error.localizedDescription)")
                    case .loaded(let weather):
                        GeometryReader { ctx in
                                    VStack {
                                        UpperView(onSearchButtonPressed: {
                                            presenter.navigateToSearch()
                                        }, onSettingsButtonPressed: {
                                            presenter.navigateToSettings()
                                        }, weather: weather)
                                            .frame(height: ctx.size.height / 2, alignment: .center)
                                            .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                                        LowerView(weather: weather)
                                        .frame(width: ctx.size.width, height: ctx.size.height / 2, alignment: .center)
                                    }
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
