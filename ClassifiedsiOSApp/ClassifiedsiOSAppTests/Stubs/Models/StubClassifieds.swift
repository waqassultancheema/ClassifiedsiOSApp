//
//  StubArticles.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ClassifiedsiOSApp

class StubClassfieds: Classifieds {
    static func dummyClassifieds() -> StubClassfieds  {
        return StubClassfieds(results: [StubClassfied.dummyClassified()])
    }
}
