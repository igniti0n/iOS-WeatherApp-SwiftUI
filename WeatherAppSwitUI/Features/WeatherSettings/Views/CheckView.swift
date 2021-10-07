//
//  CheckView.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import SwiftUI

struct CheckView: View {
    @Binding var isChecked: Bool
    let onTapped: (()->Void)?
    
    var body: some View {
        Button {
            onTapped?()
        } label: {
            if isChecked {
                Image("check" )
                    .resizable()
                    .background(Color.white)
            }else {
                Color.white
            }
        }
        .frame(width: 40, height: 40, alignment: .center)
    }
}


struct CheckView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Lol lol lol lol.")//CheckView()
    }
}
