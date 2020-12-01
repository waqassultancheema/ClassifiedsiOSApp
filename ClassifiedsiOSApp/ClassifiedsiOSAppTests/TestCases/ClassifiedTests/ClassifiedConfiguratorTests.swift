//
//  ArticlesDataSourceTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ClassifiedsiOSApp

class ClassifiedConfiguratorTests: XCTestCase {

    var sut: ClassifiedConfigurator?
    override func setUp() {
        super.setUp()
        sut = ClassifiedConfigurator(presenter: ClassifiedsPresenter(), interactor: ClassifiedsInteractor(worker: ClassifiedRemoteWorker(serviceApi: ServiceApi())), router: ClassifiedAppRouter())
    }
}
