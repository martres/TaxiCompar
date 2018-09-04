//
//  ViewController.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 31/08/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ride = Ride.current
        ride.user = User(id: "stevenmartreux")
        ride.seatCount = 1
        ride.fromLocation = Localization(address: "5 rue Joseph Rivière", coordinates: nil)
        ride.toLocation = Localization(address: "12 rue d'Athènes", coordinates: nil)
        ApiManager.shared.create(ride: ride) { (succes) in
            print("Info: Ride ID: \(Ride.current.id ?? "")")
            ApiManager.shared.get(ride: ride, completion: { (ride) in
                Ride.current.info()
            })
        }
    }
}

