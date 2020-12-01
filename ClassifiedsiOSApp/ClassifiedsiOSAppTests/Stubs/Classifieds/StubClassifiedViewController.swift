//
//  StubClassifiedViewController.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit
@testable import ClassifiedsiOSApp
class StubClassifiedViewController: ClassifiedViewController {
    
    var error:String = ""
    
    override func viewDidLoad() {
        
    }
    override func configureTableViewDataSource(tabeViewDataSource: ClassifiedTableViewDataSource = ClassifiedTableViewDataSource()) {
        tableViewDataSource  = ClassifiedTableViewDataSource()
    }
    override func displayFetchClassified(viewModel: ViewModel.DisplayViewModel) {
        tableViewDataSource.classifieds = viewModel.classifieds
    }
    override func errorClassified(error: String) {
        self.error = error
        self.view.stopActivityIndicator()
    }
}
