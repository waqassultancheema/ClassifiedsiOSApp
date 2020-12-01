//
//  StubArticleInteractor.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ClassifiedsiOSApp

class StubClassifiedInteractor: ClassifiedsInteractor {
    override func fetchClassifieds() {
        self.classifieds = StubClassfieds.dummyClassifieds()
        self.output.passedToPresenterFetchedClassifieds(classifieds: self.classifieds)
    }
}
