//
//  ApiManager.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 01/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    private var uberManager: RequestManager?
    
    override init() {
        uberManager = RequestManager(URL: "http://0.0.0.0:5000/")
    }
    
    func create(ride: Ride, completion: @escaping (Bool) -> ()) {
        let request = Request(requestHTTPType: .post, path: "uber", parameters: ride.currentPayload())
        request.resultCompletion = { (data, error) in
            guard error == nil else {
                print("[Error] Create Ride")
                completion(false)
                return
            }
            
            guard let data = data else {
                print("[Error] Create Ride nil data")
                completion(false)
                return
            }
            ride.setup(dictionnary: data)
            completion(true)
        }
        uberManager?.send(request: request)
    }
    
    func get(ride: Ride, completion: @escaping (Ride?) -> ()) {
        guard let id = ride.id else {
            print("[Error] Ride is nil")
            completion(nil)
            return
        }
        let path = "uber/" + id
        let request = Request(requestHTTPType: .get, path: path)
        request.resultCompletion = { (data, error) in
            guard error == nil else {
                print("[Error] Get Ride")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("[Error] Get Ride nil data")
                completion(nil)
                return
            }
            ride.setup(dictionnary: data)
            completion(ride)
        }
        uberManager?.send(request: request)
    }
}
