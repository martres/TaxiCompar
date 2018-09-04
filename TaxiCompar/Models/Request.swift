//
//  Request.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 31/08/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation
import Alamofire

class Request: NSObject {
    
    private(set) var requestHTTPType: Alamofire.HTTPMethod
    private(set) var parameters: [String: Any]
    private(set) var header: [String: String]?
    private(set) var path: String
    
    var dataResult: [String: Any]? {
        didSet {
            resultCompletion?(dataResult, nil)
        }
    }
    
    var error: Error? {
        didSet {
            print("[Error] Request fail")
            resultCompletion?(nil, error)
        }
    }
    
    var resultCompletion: ((_ result: [String: Any]?, _ error: Error?) -> ())?
    
    init(requestHTTPType: HTTPMethod,
         path: String,
         parameters: [String: Any] = [:],
         header: [String: String]? = nil) {
        self.requestHTTPType = requestHTTPType
        self.path = path
        self.parameters = parameters
        self.header = header
        super.init()
    }
    
    func info() {
        print("Path: \(path)\nparameters: \(parameters)")
    }
    
}
