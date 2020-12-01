//
//  WebAPI.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

typealias onCompletion = (Any?, NetworkError?)->()

public enum URLMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}


protocol WebAPIHandler {
    func getDataFromServer( url: String, withMethod method: URLMethod?,completion: @escaping onCompletion) -> URLSessionTask?
}
