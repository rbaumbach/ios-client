//
//  HTTPHeaders.swift
//  Darkly_iOS
//
//  Created by Mark Pokorny on 9/19/17. +JMJ
//  Copyright © 2017 LaunchDarkly. All rights reserved.
//

import Foundation

struct HTTPHeaders {
    
    struct Constants {
        static let apiKey = "api_key"
        static let authorization = "Authorization"
        static let userAgent = "User-Agent"
        static let sdkVersion = "3.0.0"
        static let contentType = "Content-Type"
        static let applicationJson = "application/json"
        static let accept = "Accept"
    }
    
    let mobileKey: String
    
    init(mobileKey: String) {
        self.mobileKey = mobileKey
    }
    
    var authKey: String { return "\(Constants.apiKey) \(mobileKey)" }
    var userAgent: String { return "iOS/\(Constants.sdkVersion)" }
    
    var eventSourceHeaders: [String: String] { return [Constants.authorization: authKey, Constants.userAgent: userAgent] }
    var flagRequestHeaders: [String: String] { return [Constants.authorization: authKey, Constants.userAgent: userAgent] }
    var eventRequestHeaders: [String: String] { return [Constants.authorization: authKey,
                                                       Constants.userAgent: userAgent,
                                                       Constants.contentType: Constants.applicationJson,
                                                       Constants.accept: Constants.applicationJson] }
}