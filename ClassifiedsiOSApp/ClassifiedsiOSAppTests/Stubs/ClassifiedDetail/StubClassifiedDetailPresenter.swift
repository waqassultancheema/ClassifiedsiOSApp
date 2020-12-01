//
//  StubClassifiedDetailPresenter.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ClassifiedsiOSApp

class StubClassifiedDetailPresenter: ClassifiedDetailPresenter {

    var presentFetchedClassifiedsCalled = false
    override func presentFetchClassifiedDetail(classified: Classified) {
        super.presentFetchClassifiedDetail(classified: classified)
        presentFetchedClassifiedsCalled = true
    }
}
