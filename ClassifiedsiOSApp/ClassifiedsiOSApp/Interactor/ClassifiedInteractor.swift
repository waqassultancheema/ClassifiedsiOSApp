//
//  ClassifiedsInteractor.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ClassifiedsDataSource {
    var classifieds: Classifieds! { get}
}
protocol ClassifiedsInteractorInput {

    func fetchClassifieds()
}

protocol ClassifiedsInteractorOutput {
    func passedToPresenterFetchedClassifieds(classifieds: Classifieds)
    func errorWhileFetchClassifieds(error:String)
}
class ClassifiedsInteractor:ClassifiedsInteractorInput,ClassifiedsDataSource {
   
    var classifieds: Classifieds!
    var output: ClassifiedsInteractorOutput!
    var worker: ClassifiedRemoteWorkerProtocol!
    
    init(worker: ClassifiedRemoteWorkerProtocol) {
        self.worker = worker
    }
    
    func fetchClassifieds() {
        if worker == nil {
            worker = ClassifiedRemoteWorker(serviceApi: ServiceApi())
        }
        fetchClassifiedFromWorker()
       }
    
    func fetchClassifiedFromWorker() {
        worker.fetchClassifieds ( request: Request.Fetch.ClassifiedRequest(), complete: { [unowned self] (classifieds) in
            self.classifieds = classifieds
            self.output.passedToPresenterFetchedClassifieds(classifieds: classifieds)
        }) { (error) in
            self.output.errorWhileFetchClassifieds(error: error ?? "Error Occured While Fetching")
            
        }
    }
}
