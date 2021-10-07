//
//  SearchView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct SearchView: View {
    var onSearchPressed: ((String)->Void)?
    
    @EnvironmentObject private var theme: Theme
    @State private var typedCity = ""
    
    var body: some View {
        HStack {
            TextField("City...", text: $typedCity)
                .padding(8)
                .background(Color.gray.opacity(0.6))
            Image("search")
                .onTapGesture {
                    if !typedCity.trimmingCharacters(in: [" "]).isEmpty {
                        onSearchPressed?(typedCity)
                    }
                }
        }
        .font(theme.normalFont)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
