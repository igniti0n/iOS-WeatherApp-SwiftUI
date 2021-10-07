//
//  LocationSearchView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct LocationSearchView: View {
    var onCitySearch: ((String)->Void)?
    @ObservedObject private var viewModel: LocationSearchViewModel
    
    init(viewModel: LocationSearchViewModel, onCitySearch: ((String)->Void)?) {
        self.viewModel = viewModel
        self.onCitySearch = onCitySearch
    }
    
    var body: some View {
        BackgroundView {
            VStack(alignment: .leading, spacing: 20) {
                SearchView { cityName  in
                    onCitySearch?(cityName)
                }
                SearchedCitiesView(cities: $viewModel.searchedCities) { cityName in
                    onCitySearch?(cityName)
                }
                
            }
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 0, trailing: 40))
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(viewModel: LocationSearchViewModel(),onCitySearch: nil)
    }
}
