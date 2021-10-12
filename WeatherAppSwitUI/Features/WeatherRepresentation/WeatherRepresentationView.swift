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
    
    init(viewModel: WeatherReperesentationViewModel, presenter: WeatherRepresentationPresenterView) {
        self.viewModel = viewModel
        self.presenter = presenter
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
                    WeatherRepresentationContentView(weather: weather, presenter: presenter)
                }
            }
            .navigationBarHidden(true)
            .environmentObject(viewModel.settings)
            .environmentObject(Theme())
            .onAppear() {
                presenter.getCurrentWeatherSettings()
                presenter.getCurrentWeather()
            }
            .alert(isPresented: $viewModel.isErrorAlertShown) {
                Alert(title: Text( "Operation failed"), message: Text(viewModel.errorMessage), dismissButton: .some(.cancel(Text("Okay."))))
            }
        }
    }
}



struct WeatherRepresentationView_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //            WeatherRepresentationView(viewModel: WeatherReperesentationViewModel())
    }
}
