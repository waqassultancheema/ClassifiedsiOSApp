//
//  ArticleAppRouterTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassfiedAppRouterTests: XCTestCase {


    var sut: ClassifiedAppRouter?
    var classifiedViewController: ClassifiedViewController?
    var stubWorker: ClassifiedRemoteWorkerProtocol!
    override func setUp() {
        super.setUp()
        sut = ClassifiedAppRouter()
        stubWorker = StubClassifiedRemoteWorker()
        (stubWorker as! StubClassifiedRemoteWorker).dataToReturnOnSuccess = StubClassfieds.dummyClassifieds()
        
        classifiedViewController =  (UIStoryboard.viewController(screenName: "ClassifiedViewController", storyboardName: "Main") as! ClassifiedViewController)
        classifiedViewController?.configurator.interactor.worker = stubWorker
        classifiedViewController?.fetchClassified()
        sut?.classifiedViewController = classifiedViewController
        sut?.datasource = classifiedViewController?.configurator.interactor

    }
    func testShowDetailMethod() {
        sut?.showDetailViewController(index: 0)
    }
    
    
   

}
