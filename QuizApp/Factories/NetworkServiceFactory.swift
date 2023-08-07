//
//  NetworkServiceFactory.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> WebserviceProtocol {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        if let environment, environment == "TEST" {
            return Webservice()
        }
        return Webservice()
    }
}
