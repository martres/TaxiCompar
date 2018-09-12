//
//  FormRideModel.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 09/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation
import MapKit

protocol FormRideModelProtocol {
    func numberOfSection() -> Int
    func numberOfCell(in section: Int) -> Int
}

enum FormRideCellType {
    case from
    case to
    case seat
    case time
}

final class FormRideModel {
    
    private var ride: Ride = Ride.current
    
}

extension FormRideModel: FormRideModelProtocol {
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfCell(in section: Int) -> Int {
        return 1
    }
    
    
    
}
