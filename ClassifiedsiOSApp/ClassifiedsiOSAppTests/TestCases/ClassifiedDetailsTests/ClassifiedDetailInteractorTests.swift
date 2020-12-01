//
//  ClassifiedDetailInteractorTests.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassifiedDetailInteractorTests: XCTestCase {
    
    var sut: ClassifiedDetailInteractor?
    var sutClassifiedDetailViewController: StubClassifiedDetailViewController?
    override func setUp() {
        super.setUp()
        sut = ClassifiedDetailInteractor()
        sutClassifiedDetailViewController = StubClassifiedDetailViewController()
        sutClassifiedDetailViewController?.configureTableViewDataSource()
    }

    func testFetchClassifiedhouldPresenterCalled() {
        
        let stubClassifiedDetailPresentation = StubClassifiedDetailPresenter()
        stubClassifiedDetailPresentation.output = sutClassifiedDetailViewController
        sut?.output = stubClassifiedDetailPresentation
        sut?.getClassifiedDetail(classified: StubClassfied.dummyClassified())
       // XCTAssertTrue(stubClassifiedDetailPresentation.presentFetchedClassifiedCalled, "")
    }
    
    func testFetchClassifiedhouldAskPresenterToFormatResult() {
        let stubClassifiedDetailPresentation = StubClassifiedDetailPresenter()
        stubClassifiedDetailPresentation.output = sutClassifiedDetailViewController
        sut?.output = stubClassifiedDetailPresentation
        sut?.getClassifiedDetail(classified: StubClassfied.dummyClassified())
        let displayClassified = sutClassifiedDetailViewController?.tableViewDataSource.classified
        XCTAssertNotNil(displayClassified?.name)
    }
}
