//
//  EmployeeDetailViewModel.swift
//  VMDirectory
//
//  Created by Gauri Rohan on 07/12/20.
//  Copyright © 2020 Gauri. All rights reserved.
//

import Foundation
import CoreLocation

class EmployeeDetailViewModel: NSObject {

    /// Find the employee location/region/country from the CLPlacemark
    ///
    /// - Parameters:
    ///     - latitude: location latitude value
    ///     - longitude: location longitude value
    ///     - completionHandler: block that will be invoked when the request reverseGeocodeLocation completes
    func lookUpCurrentLocation(latitude: String,
                               longitude: String,
                               completionHandler: @escaping (CLPlacemark?) -> Void) {
        
        let numberFormatter = NumberFormatter()
        guard let lat = numberFormatter.number(from: latitude),
            let long = numberFormatter.number(from:longitude) else {
                completionHandler(nil)
                return
        }
        
        let location = CLLocation(latitude: CLLocationDegrees(lat.doubleValue),
                                  longitude: CLLocationDegrees(long.doubleValue))
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
            if error == nil {
                let firstLocation = placemarks?[0]
                completionHandler(firstLocation)
            }
            else {
                // An error occurred during geocoding.
                completionHandler(nil)
            }
        })
    }
}
