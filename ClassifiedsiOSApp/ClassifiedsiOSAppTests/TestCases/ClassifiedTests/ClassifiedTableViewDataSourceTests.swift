//
//  ArticleTableViewDataSourceTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassifiedTableViewDataSourceTests: XCTestCase {

    var sut:ClassifiedTableViewDataSource?
    var classifiedViewController: ClassifiedViewController?
    var stubTableView:StubTableView?
    var stubWorker:StubClassifiedRemoteWorker?
    override func setUp() {
        super.setUp()
        
        stubWorker = StubClassifiedRemoteWorker()
        stubWorker?.dataToReturnOnSuccess = StubClassfieds.dummyClassifieds()
        
        classifiedViewController =  (UIStoryboard.viewController(screenName: "ClassifiedViewController",
                                                                 storyboardName: "Main") as! ClassifiedViewController)
        
        stubTableView = StubTableView(frame: CGRect(x: (classifiedViewController?.view.frame.origin.x)!,
                                                    y: (classifiedViewController?.view.frame.origin.y)!,
                                                    width: (classifiedViewController?.view.frame.size.width)!,
                                                    height: (classifiedViewController?.view.frame.size.height)!),
                                      style: .plain)
        classifiedViewController?.tableView = stubTableView
        classifiedViewController?.viewDidLoad()
        sut = classifiedViewController?.tableViewDataSource
        classifiedViewController?.configurator.interactor.worker = stubWorker
        classifiedViewController?.fetchClassified()
    }
    
    func testCellForIndexPath() {
        _ = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 0, section: 0))
        XCTAssertTrue(stubTableView!.isdequeueCalled)
    }
    
    func testCellForNumberOfItems() {
        let row  = sut?.tableView(stubTableView!, numberOfRowsInSection: 0)
        XCTAssertTrue(row ?? 0 > 0)
    }
}

