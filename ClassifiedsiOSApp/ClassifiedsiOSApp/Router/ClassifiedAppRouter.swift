//
//  ClassifiedAppRouter.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit


protocol ClassifiedDataPassing {
    var datasource: ClassifiedsDataSource! {get set}

}
protocol ClassifiedAppRouterView {
    func showDetailViewController(index:Int)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class ClassifiedAppRouter: ClassifiedAppRouterView, ClassifiedDataPassing {
    
    var datasource: ClassifiedsDataSource!
    var classifiedViewController:ClassifiedViewController? = nil
    var navigationController:UINavigationController? = nil
    var selectedIndex = 0
    
    func showDetailViewController(index:Int) {
        selectedIndex = index
        classifiedViewController?.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            let viewController = segue.destination as? ClassifiedDetailViewController
           // viewController?.tableViewDataSource = ArticleDetailTableViewDataSource()
            viewController?.configureTableViewDataSource(tblViewDataSource: ClassifiedDetailTableViewDataSource())
            viewController?.configurator.interactor.getClassifiedDetail(classified: datasource.classifieds.results![selectedIndex])
        }
    }
}

