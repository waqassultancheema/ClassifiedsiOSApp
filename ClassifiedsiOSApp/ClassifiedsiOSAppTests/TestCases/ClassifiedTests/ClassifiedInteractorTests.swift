//
//  ClassifiedsInteractorTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassifiedsInteractorTests: XCTestCase {
    
    var sut:ClassifiedsInteractor?
    var stubRemoteWorker: ClassifiedRemoteWorkerProtocol?
    var sutClassifiedsViewController: StubClassifiedViewController?
    override func setUp() {
        super.setUp()
        sut = ClassifiedsInteractor(worker: StubClassifiedRemoteWorker())
        sutClassifiedsViewController = StubClassifiedViewController()
        sutClassifiedsViewController?.configureTableViewDataSource()
        stubRemoteWorker = StubClassifiedRemoteWorker()
        (stubRemoteWorker as! StubClassifiedRemoteWorker).dataToReturnOnSuccess = StubClassfieds.dummyClassifieds()
    }

    func testFetchClassifiedsShouldPresenterCalled() {
        let stubClassifiedsPresentation = StubClassifiedPresenter()
        stubClassifiedsPresentation.output = sutClassifiedsViewController
        sut?.output = stubClassifiedsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchClassifieds()
        XCTAssertTrue(stubClassifiedsPresentation.presentFetchedClassifiedsCalled, "")
    }
    
    func testFetchClassifiedsShouldAskPresenterToFormatResult() {
        let stubClassifiedsPresentation = StubClassifiedPresenter()
        stubClassifiedsPresentation.output = sutClassifiedsViewController
        sut?.output = stubClassifiedsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchClassifieds()
        let classified = sutClassifiedsViewController?.tableViewDataSource.classifieds.first
        XCTAssertNotNil(classified)
    }
    
    func testFetchClassifiedsShouldReturnError() {
        let stubClassifiedsPresentation = StubClassifiedPresenter()
        stubClassifiedsPresentation.output = sutClassifiedsViewController
        (stubRemoteWorker as! StubClassifiedRemoteWorker).shouldFailOnFetch = true
        sut?.output = stubClassifiedsPresentation
        sut?.worker = stubRemoteWorker
          sutClassifiedsViewController?.viewDidLoad()
        sut?.fetchClassifieds()
        XCTAssertNotNil(sutClassifiedsViewController?.error)
    }
    
    func testFetchClassifiedsShouldReturnClassified() {
        let stubClassifiedsPresentation = StubClassifiedPresenter()
        stubClassifiedsPresentation.output = sutClassifiedsViewController
        sut?.output = stubClassifiedsPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchClassifieds()
        let classified = sutClassifiedsViewController?.tableViewDataSource.classifieds.first
        XCTAssertNotNil(classified)
    }
}
