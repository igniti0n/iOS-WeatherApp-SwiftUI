//
//  LocationService.swift
//  WeatherAppSwitUI
//
//  Created by Ivan Stajcer on 06.10.2021..
//

import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    var locationChangedHandler: ((CLLocationCoordinate2D)->Void)?
    var lastKnownLocation: CLLocationCoordinate2D? {
        willSet {
            if newValue != nil {
                locationChangedHandler?(newValue!)
            }
        }
    }

    override init() {
        super.init()
        manager.delegate = self
    }

    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
