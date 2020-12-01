//
//  StubClassifiedDetailViewController.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

@testable import ClassifiedsiOSApp
class StubClassifiedDetailViewController: ClassifiedDetailViewController {

    override func configureTableViewDataSource(tblViewDataSource: ClassifiedDetailTableViewDataSource = ClassifiedDetailTableViewDataSource()) {
        tableViewDataSource = tblViewDataSource
    }
    override func displayFetchClassifiedDetail(viewModel: ViewModel.DisplayViewModel.ClassifiedViewModel) {
        tableViewDataSource.classified = viewModel

    }
}
