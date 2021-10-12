//
//  SearchedCitiesView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct SearchedCitiesView: View {
    var onCityPressed: ((String)->Void)?
    let cities: Array<String>
    
    @EnvironmentObject private var theme: Theme
    
    init(cities: Array<String>, onCityPressed: ((String)->Void)?) {
        UITableViewCell.appearance().backgroundColor = .none
        UITableView.appearance().backgroundColor = .none
        UITableView.appearance().separatorStyle = .none
        self.cities = cities
        self.onCityPressed = onCityPressed
    }
    
    var body: some View {
        List {
            ForEach(0..<cities.count, id: \.self){ index in
                Text(cities[index])
                    .background(Color.clear)
                    .onTapGesture {
                        onCityPressed?(cities[index])
                    }
            }
            .listRowBackground(Color.clear)
            .background(Color.clear)
        }
        .listRowBackground(Color.clear)
        .background(Color.clear)
        .offset(CGSize(width: -8.0, height: 0.0))
        .font(theme.normalFont)
    }
}

struct SearchedCitiesView_Previews: PreviewProvider {
    static var previews: some View {
        Text("lol lol lol lol")//SearchedCitiesView()
    }
}
