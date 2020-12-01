//
//  ClassifiedDetailPresenterTests.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassifiedDetailPresenterTests: XCTestCase {

    var stubClassfied: StubClassfied?
    var sutPres: ClassifiedDetailPresenter?

    override func setUp() {
        super.setUp()
        stubClassfied = StubClassfied.dummyClassified()
        sutPres = ClassifiedDetailPresenter()
    }

    func testPresenterShouldReturnNameForDisplay() {
        let stubClassifiedDetailViewController: StubClassifiedDetailViewController = StubClassifiedDetailViewController()
        stubClassifiedDetailViewController.configureTableViewDataSource()
        sutPres?.output = stubClassifiedDetailViewController
        sutPres?.presentFetchClassifiedDetail(classified: stubClassfied!)
        let classified = stubClassifiedDetailViewController.tableViewDataSource.classified
        XCTAssertNotEqual(classified.name, "")
    }
    
    func testPresenterShouldReturnFormatPrice() {
        let stubClassifiedDetailViewController: StubClassifiedDetailViewController = StubClassifiedDetailViewController()
        stubClassifiedDetailViewController.configureTableViewDataSource()
        sutPres?.output = stubClassifiedDetailViewController
        sutPres?.presentFetchClassifiedDetail(classified: stubClassfied!)
        let classified = stubClassifiedDetailViewController.tableViewDataSource.classified
        XCTAssertNotNil(classified.price)
    }
   
    
   

    
    


}
