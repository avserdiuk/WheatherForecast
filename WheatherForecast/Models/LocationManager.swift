//
//  LocationManager.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 31.03.2023.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate{

    private lazy var locationManager : CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()

        func locationManagerDidChangeAuthorization(
            _ manager: CLLocationManager
        ) {
            switch manager.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                manager.requestLocation()
            case .denied, .restricted:
                print("Определение локации невозможно")
            case .notDetermined:
                print("Определение локации не запрошено")
            @unknown default:
                fatalError()
            }
        }

        func locationManager(
            _ manager: CLLocationManager,
            didUpdateLocations locations: [CLLocation]
        ) {
            if let location = locations.first {
//                let controller = PageViewController()
//                controller.currentCoords = location.coordinate
//                navigationController?.pushViewController(controller, animated: true)
            } else {
                print("Не удалось получить координаты")
            }
        }

        func locationManager(
            _ manager: CLLocationManager,
            didFailWithError error: Error
        ) {
            // Handle failure to get a user’s location
        }
    }
