//
//  RequestManager.swift
//  TaxiCompar
//
//  Created by Steven Martreux on 31/08/2018.
//  Copyright © 2018 Steven.Martreux. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

private struct ApiConstant {
    static let URL: String = "http://0.0.0.0:5000/uber/"
}

final class RequestManager: NSObject {
    
    private(set) var currentRequest: Request? {
        didSet {
            startRequest()
        }
    }
    
    private var URL: String
    
    init(URL: String) {
        self.URL = URL
    }
    
    func send(request: Request) {
        self.currentRequest = request
    }
    
    private func basicHeaders() -> [String: String] {
        return ["Content-Type": "application/json", "accept": "application/json"]
    }
    
    private func startRequest() {
        guard let currentRequest = currentRequest else { return }
        let url = URL + currentRequest.path
        currentRequest.info()
        Alamofire.request(url,
                          method: currentRequest.requestHTTPType,
                          parameters: currentRequest.parameters,
                          encoding: JSONEncoding.default,
                          headers: basicHeaders())
            .responseJSON { response in
                guard response.result.error == nil else {
                    currentRequest.error = response.result.error
                    return
                }
                
                guard let jsonData = response.result.value as? [String: Any] else {
                    currentRequest.error = response.result.error
                    return
                }
                
                currentRequest.dataResult = jsonData
        }
    }
    
}
