//
//  ClassifiedDetailViewController.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit



protocol ClassifiedDetailViewControllerDisplayedLogic {
    func displayFetchClassifiedDetail(viewModel: ViewModel.DisplayViewModel.ClassifiedViewModel)
}

class ClassifiedDetailViewController: UIViewController,ClassifiedDetailViewControllerDisplayedLogic {


    @IBOutlet weak var tableView: UITableView!
    
    let configurator = ClassifiedDetailConfigurator()
    var tableViewDataSource:ClassifiedDetailTableViewDataSource!

    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellForTableView()
        configureTableViewDataSource()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    internal func registerCellForTableView() {
        self.tableView.register(UINib(nibName: "ClassifiedTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "ClassifiedTitleTableViewCell")
        self.tableView.register(UINib(nibName: "ClassifiedInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ClassifiedInfoTableViewCell")
        self.tableView.register(UINib(nibName: "ClassifiedImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ClassifiedImageTableViewCell")

    }

    internal func configureTableViewDataSource(tblViewDataSource:ClassifiedDetailTableViewDataSource = ClassifiedDetailTableViewDataSource()) {
        if tableViewDataSource == nil {
            tableViewDataSource = tblViewDataSource
        }
        if let tableView = tableView {
            tableView.delegate = tableViewDataSource
            tableView.dataSource = tableViewDataSource
        }
    }

    func displayFetchClassifiedDetail(viewModel: ViewModel.DisplayViewModel.ClassifiedViewModel) {
        self.tableViewDataSource.classified = viewModel
    }
}
