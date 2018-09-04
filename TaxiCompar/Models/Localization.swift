//
//  Location.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 01/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation

class Localization {

    var address: String?
    var coordinates: Coordinates?
    
    init(address: String?, coordinates: Coordinates?) {
        self.address = address
        self.coordinates = coordinates
    }
    
    init(dictionnary: [String: Any]) {
        if let address = dictionnary["address"] as? String {
            self.address = address
        }
        
        if let coordinatesDict = dictionnary["coordinates"] as? [String: Any] {
            self.coordinates = Coordinates(dictionnary: coordinatesDict)
        }
    }
    
    func info() {
        let address = "Address: \(self.address ?? "")\n"
        let lat = "Lat : \(coordinates?.lat ?? -1)\n"
        let long = "Long: \(coordinates?.long ?? -1)\n"
        print(address + lat + long)
    }
    
}
