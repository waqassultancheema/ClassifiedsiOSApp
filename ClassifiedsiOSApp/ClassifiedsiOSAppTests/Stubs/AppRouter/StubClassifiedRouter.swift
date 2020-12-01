//
//  StubClassifiedRouter.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit


@testable import ClassifiedsiOSApp

class StubClassifiedRouter: ClassifiedAppRouter {
    
    var isPrepareRouterCalled = false
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        isPrepareRouterCalled = true
    }
}
