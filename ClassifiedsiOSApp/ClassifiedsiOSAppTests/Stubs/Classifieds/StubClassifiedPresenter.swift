//
//  StubClassifiedsPresenter.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ClassifiedsiOSApp

class StubClassifiedPresenter: ClassifiedsPresenter {

    var presentFetchedClassifiedsCalled = false

    override func presentFetchClassifieds(classifieds: Classifieds) {
        super.presentFetchClassifieds(classifieds: classifieds)
        presentFetchedClassifiedsCalled  = true
    }
}
