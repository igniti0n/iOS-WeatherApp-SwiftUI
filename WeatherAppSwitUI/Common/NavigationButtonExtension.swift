//
//  NavigationButtonExtension.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 07.10.2021..
//

import Foundation
import SwiftUI

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.tintColor = UIColor.black
    }
}
