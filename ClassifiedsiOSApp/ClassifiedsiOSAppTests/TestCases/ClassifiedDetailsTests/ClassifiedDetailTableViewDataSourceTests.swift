//
//  ClassifiedDetailTableViewDataSourceTests.swift
//  ClassifiedsDemoAppTests
//
//  Created by Waqas Sultan on 9/14/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassifiedDetailTableViewDataSourceTests: XCTestCase {

    var sut: ClassifiedDetailTableViewDataSource?
    var classifiedDetailViewController: ClassifiedDetailViewController?
    var stubTableView:StubTableView?
    override func setUp() {
        super.setUp()
        classifiedDetailViewController =  (UIStoryboard.viewController(screenName: "ClassifiedDetailViewController", storyboardName: "Main") as! ClassifiedDetailViewController)
        stubTableView = StubTableView(frame: CGRect(x: (classifiedDetailViewController?.view.frame.origin.x)!, y: (classifiedDetailViewController?.view.frame.origin.y)!, width: (classifiedDetailViewController?.view.frame.size.width)!, height: (classifiedDetailViewController?.view.frame.size.height)!), style: .plain)
        classifiedDetailViewController?.tableView = stubTableView
        classifiedDetailViewController?.viewDidLoad()
        sut = classifiedDetailViewController?.tableViewDataSource
        classifiedDetailViewController?.configurator.interactor.getClassifiedDetail(classified: StubClassfied.dummyClassified())
    }
    
    func testCellForTitleIndexPath() {
        let cell:ClassifiedTitleTableViewCell = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 0, section: 0)) as! ClassifiedTitleTableViewCell
        XCTAssertTrue(cell.titleLabel.text?.count ?? 0 > 0)
    }
    
    func testCellForImageIndexPath() {
        let cell:ClassifiedImageTableViewCell = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 2, section: 0)) as! ClassifiedImageTableViewCell
        XCTAssertTrue(cell.captionLabel.text?.count ?? 0 > 0)
    }

    func testCellForNumberOfItems() {
        let row  = sut?.tableView(stubTableView!, numberOfRowsInSection: 0)
        XCTAssertTrue(row ?? 0 > 0)
    }
}
