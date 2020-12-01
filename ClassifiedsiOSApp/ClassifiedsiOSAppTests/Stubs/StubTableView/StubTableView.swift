//
//  StubTableView.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class StubTableView: UITableView {

    var isdequeueCalled = false
    var cell:UITableViewCell?
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        isdequeueCalled = true
        return super.dequeueReusableCell(withIdentifier: identifier)
    }
}
