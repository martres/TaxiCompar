//
//  UniqueID.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 04/09/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import UIKit

func getUniqueID() -> String? {
    return UIDevice.current.identifierForVendor?.uuidString
}
