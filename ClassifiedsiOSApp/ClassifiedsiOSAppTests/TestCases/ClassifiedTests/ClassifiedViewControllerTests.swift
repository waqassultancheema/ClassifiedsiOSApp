//
//  ArticleViewControllerTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
import UIKit
@testable import ClassifiedsiOSApp

class ClassifiedViewControllerTests: XCTestCase {
    
    var sut: ClassifiedViewController?
    var stubRouter = StubClassifiedRouter()
    var stubNavigationController: StubNavigationViewController?
    override func setUp() {
        super.setUp()
        sut = UIStoryboard.viewController(screenName: "ClassifiedViewController", storyboardName: "Main") as? ClassifiedViewController
        stubNavigationController = StubNavigationViewController(rootViewController: sut!)
        sut?.router = stubRouter
    }
    
    func testPrepareForSegueCalled() {
        sut?.performSegue(withIdentifier: "showDetail", sender: nil)
        XCTAssertTrue(stubRouter.isPrepareRouterCalled)
    }
    
    func testNavigationBarHiddenCalled() {
        sut?.viewWillDisappear(true)
        XCTAssertTrue(stubNavigationController?.isNavigationBarHiddenCalled ?? false)
    }
}
