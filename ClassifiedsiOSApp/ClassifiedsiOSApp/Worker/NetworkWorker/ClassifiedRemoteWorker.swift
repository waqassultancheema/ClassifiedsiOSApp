//
//  ClassifiedRemoteApi.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//



import Foundation

protocol ClassifiedRemoteWorkerProtocol {
    func fetchClassifieds(request:Request.Fetch.ClassifiedRequest , complete :@escaping (Classifieds) -> Void, failure:@escaping (String?) -> Void)
    var serviceApi:ServiceApi! {get set}
}

class ClassifiedRemoteWorker: ClassifiedRemoteWorkerProtocol {
   
    
    var serviceApi:ServiceApi!
    
    init(serviceApi: ServiceApi) {
        self.serviceApi = serviceApi
    }
    
    func fetchClassifieds(request:Request.Fetch.ClassifiedRequest , complete :@escaping (Classifieds) -> Void, failure:@escaping (String?) -> Void) {
        
        if serviceApi == nil {
            serviceApi = ServiceApi()
        }
        serviceApi.getData(url: request.mURL, withMethod: .GET) {  (response, error) in
            guard error == nil else {
                failure(error?.localizedDescription)
                return
            }
            if let mData = response as? Data {
                do {
                    let classifieds = try Classifieds(data: mData)
                   complete(classifieds)
                } catch  {
                    failure(error.localizedDescription)
                }
            }
        }
    }
}
