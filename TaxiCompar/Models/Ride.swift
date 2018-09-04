//
//  User.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 01/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation

enum RideStatus: String {
    case unknown = ""
    case pending = "pending"
    case stoped = "stoped"
    case done = "done"
}

class Ride: NSObject {

    // Singleton
    static let current = Ride()

    var id: String?
    var user: User?
    var createdAt: String?
    var fromLocation: Localization?
    var toLocation: Localization?
    var seatCount: Int = 1
    var status: RideStatus = .unknown
    var numberIterations: Int = 0
    
    override init() {}
    
    func setup(dictionnary: [String: Any]) {
        if let id = dictionnary["id"] as? String {
            self.id = id
        }
        
        if let userID = dictionnary["user_id"] as? String {
            user = User(id: userID)
        }
        
        if let createdAt = dictionnary["created_at"] as? String {
            self.createdAt = createdAt
        }
        
        if let fromLocationDict = dictionnary["from"] as? [String: Any] {
            self.fromLocation = Localization(dictionnary: fromLocationDict)
        }
        
        if let toLocaltionDict = dictionnary["to"] as? [String: Any] {
            self.toLocation = Localization(dictionnary: toLocaltionDict)
        }
        
        if let status = dictionnary["status"] as? String {
            self.status = RideStatus(rawValue: status) ?? .unknown
        }
        
        if let numberIterations = dictionnary["iteration"] as? Int {
            self.numberIterations = numberIterations
        }
        
        if let seatCount = dictionnary["seat_count"] as? Int {
            self.seatCount = seatCount
        }
    }
    
    func currentPayload() -> [String: Any] {
        return [
            "from": fromLocation?.address ?? "",
            "to": toLocation?.address ?? "",
            "number_seat": seatCount,
            "user_id": user?.id ?? "PASIDPASCHOCOLAT"
        ]
    }
    
    func info() {
        let rideInfo = "Ride \(id ?? "nil") info:\n"
        let createdAt = "Created at: \(self.createdAt ?? "")"
        let userId = "userID : \(user?.id ?? "")\n"
        let seatCount = "numberSeat : \(self.seatCount)\n"
        let numberIterations = "iteration: \(self.numberIterations)\n"
        print(rideInfo + createdAt + userId + seatCount + numberIterations)
        toLocation?.info()
        fromLocation?.info()
    }
    
}
