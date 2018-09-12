//
//  Coordinates.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 01/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation

class Coordinates {
    
    var lat: Double = -1
    var long: Double = -1
    
    init(lat: Double, long: Double) {
        self.lat = lat
        self.long = long
    }
    
    init(dictionnary: [String: Any]) {
        lat = dictionnary["lat"] as? Double ?? -1
        long = dictionnary["long"] as? Double ?? -1
    }
}
