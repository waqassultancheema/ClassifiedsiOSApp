//
//  RequestModel.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/11/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

enum Request {
    enum Fetch
    {
        struct ClassifiedRequest
        {
            var mURL: String {
                let url = String(format: APIURLPrefix + "default/dynamodb-writer")
                return url
            }
        }
    }
}
