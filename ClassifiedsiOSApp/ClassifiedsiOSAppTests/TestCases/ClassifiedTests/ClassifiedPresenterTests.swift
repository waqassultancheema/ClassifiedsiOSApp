//
//  ArticlesPresenterTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassfiedPresenterTests: XCTestCase {

    var stubClassfieds: StubClassfieds!
    var sutPres: ClassifiedsPresenter!

    override func setUp() {
        super.setUp()
        stubClassfieds = StubClassfieds.dummyClassifieds()
        sutPres = ClassifiedsPresenter()
    }
    
    func testPresentArticlesShouldFormatPostForDisplay() {
        let stubClassifiedViewController: StubClassifiedViewController = StubClassifiedViewController()
        stubClassifiedViewController.configureTableViewDataSource()
        sutPres.output = stubClassifiedViewController
        sutPres.presentFetchClassifieds(classifieds: stubClassfieds)
        let displayClassified = stubClassifiedViewController.tableViewDataSource.classifieds.first
        XCTAssertNotNil(displayClassified)
    }
}
