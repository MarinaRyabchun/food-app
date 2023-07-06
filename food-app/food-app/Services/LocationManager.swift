//
//  LocationManager.swift
//  food-app
//
//  Created by Марина Рябчун on 05.07.2023.
//

import CoreLocation
import CoreLocationUI

struct Location: Identifiable {
    let id = UUID()
    let lat: Double
    let lon: Double
}

class Locator: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var location: Location?
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.last?.coordinate else {
            location = nil
            return
        }
        location = Location(lat: coordinate.latitude, lon: coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        location = nil
    }
}

struct LocationConfig {
    let geocoder = CLGeocoder()
    var text = Self.noCityText
    static let noCityText = "No City"
    
    mutating func reverseGeocode(location: Location) async {
        text = Self.noCityText
        let location = CLLocation(latitude: location.lat, longitude: location.lon)
        if let city = try? await geocoder.reverseGeocodeLocation(location)
            .first
            .flatMap({ placemark in
                placemark.locality
            })
        {
            text = city
        }
        else {
            text = Self.noCityText
        }
    }
}

