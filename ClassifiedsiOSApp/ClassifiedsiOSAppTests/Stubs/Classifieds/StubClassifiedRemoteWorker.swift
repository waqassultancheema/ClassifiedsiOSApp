//
//  StubClassifiedRemoteWorker.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import ClassifiedsiOSApp

class StubClassifiedRemoteWorker: ClassifiedRemoteWorkerProtocol {
    
    var serviceApi: ServiceApi!
    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:Classifieds?
    
    func fetchClassifieds(request:Request.Fetch.ClassifiedRequest , complete :@escaping (Classifieds) -> Void, failure:@escaping (String?) -> Void) {
        if shouldFailOnFetch {
            failure(NetworkError.other("Test failing").localizedDescription)
        } else {
            if let data = dataToReturnOnSuccess {
                complete(data)
            }
        }
    }

}
