//
//  Coordinates.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 01/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation

class Coordinates {
    
    var lat: Float = -1
    var long: Float = -1
    
    init(lat: Float, long: Float) {
        self.lat = lat
        self.long = long
    }
    
    init(dictionnary: [String: Any]) {
        lat = dictionnary["lat"] as? Float ?? -1
        long = dictionnary["long"] as? Float ?? -1
    }
}
