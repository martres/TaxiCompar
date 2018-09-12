//
//  ViewController.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 31/08/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import UIKit
import MapKit

//let ride = Ride.current
//ride.user = User(id: "stevenmartreux")
//ride.seatCount = 1
//ride.fromLocation = Localization(address: "5 rue Joseph Rivière", coordinates: nil)
//ride.toLocation = Localization(address: "12 rue d'Athènes", coordinates: nil)
//ApiManager.shared.create(ride: ride) { (succes) in
//    print("Info: Ride ID: \(Ride.current.id ?? "")")
//    ApiManager.shared.get(ride: ride, completion: { (ride) in
//        Ride.current.info()
//    })
//}


class MapViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var formRideTableView: UITableView!
    
    var formRideModel: FormRideModelProtocol = FormRideModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        formRideTableView.delegate = self
        formRideTableView.dataSource = self
    }
}

//MARK: UITableViewDelegate

extension MapViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return formRideModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formRideModel.numberOfCell(in: section)
    }
}

//MARK: UITableViewDataSource

extension MapViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: SearchAdressCell.identifier, for: indexPath) as? SearchAdressCell {
            searchCell?.textFieldResultDelegate = self
            searchCell?.tag = FormRideCellType.from
        }
    }
    
}

// MARK: TextFieldResult

extension MapViewController: TextFieldResult {
    
    func didStartEditing(id: Int) {
        if id == FormRideCellType.from {
            
        }
    }
    
    func didEndEditing(id: Int, string: String) {
        
    }
    
}



