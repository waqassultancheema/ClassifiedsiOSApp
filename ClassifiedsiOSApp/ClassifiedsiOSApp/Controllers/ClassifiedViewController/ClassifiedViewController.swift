//
// ClassifiedViewController.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ClassifiedViewControllerGetClassified
{
    func fetchItems()
}

protocol ClassifiedViewControllerDisplayedLogic {
    func displayFetchClassified(viewModel:ViewModel.DisplayViewModel)
}

class ClassifiedViewController: UIViewController,ClassifiedViewControllerDisplayedLogic {

    @IBOutlet weak var tableView: UITableView!
    
    var configurator: ClassifiedConfigurator!
    var requestClassified: ClassifiedViewControllerGetClassified!
    var router: ClassifiedAppRouter!
    var tableViewDataSource:ClassifiedTableViewDataSource!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator = ClassifiedConfigurator(presenter: ClassifiedsPresenter(), interactor: ClassifiedsInteractor(worker: ClassifiedRemoteWorker(serviceApi: ServiceApi())), router: ClassifiedAppRouter())
        configurator.configure(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCellForTableView()
        configureTableViewDataSource()
       
        fetchClassified()
        handleTableViewSelection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.prepare(for: segue, sender: sender)
    }
    
    internal func registerCellForTableView() {
        self.tableView.register(UINib(nibName: "ClassifiedImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ClassifiedImageTableViewCell")
    }
    
    internal func fetchClassified() {
        self.view.startActivityIndicator()
        self.requestClassified.fetchItems()
    }
    internal func configureTableViewDataSource(tabeViewDataSource:ClassifiedTableViewDataSource = ClassifiedTableViewDataSource()) {
        tableViewDataSource  = tabeViewDataSource
        tableViewDataSource.delegate = self
        if let tableView = tableView {
            tableView.delegate = tableViewDataSource
            tableView.dataSource = tableViewDataSource
        }
    }

    func displayFetchClassified(viewModel: ViewModel.DisplayViewModel) {
        self.tableViewDataSource.classifieds = viewModel.classifieds
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivityIndicator()
        }
    }
    
    func errorClassified(error: String) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivityIndicator()
            self.displayalert(title: "Error", message: error)
        }
    }
}
extension ClassifiedViewController : ClassifiedTableViewDataSourceDelegate {
    func selectedClassified(index: Int) {
        self.router.showDetailViewController(index: index)
    }

}

extension ClassifiedViewController: ClassifiedsPresenterOutput , AlertView
{
    func errorWhileFetchingClassifieds(error: String) {
        self.errorClassified(error: error)
    }
    
    func successFetchedClassifieds(viewModel: ViewModel.DisplayViewModel) {
        self.displayFetchClassified(viewModel: viewModel)
    }
    
    func handleTableViewSelection() {
        //        self.tableViewDataSource.userSelected  = { [unowned self] (user) in
        //
        //
        //        }
        
    }
}
