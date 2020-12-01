//
//  ClassifiedConfigurator.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit


extension ClassifiedsInteractor: ClassifiedViewControllerGetClassified
{
    func fetchItems() {
        self.fetchClassifieds()
    }
}

extension ClassifiedsPresenter: ClassifiedsInteractorOutput
{
    func passedToPresenterFetchedClassifieds(classifieds: Classifieds) {
        self.presentFetchClassifieds(classifieds: classifieds)
    }
    
    func errorWhileFetchClassifieds(error: String) {
        self.presentFetchedError(error: error)
    }
}

class ClassifiedConfigurator: NSObject {

    let presenter: ClassifiedsPresenter!
    let interactor: ClassifiedsInteractor!
    let router: ClassifiedAppRouter!
    
    init(presenter: ClassifiedsPresenter, interactor: ClassifiedsInteractor, router: ClassifiedAppRouter) {
        self.presenter = presenter
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Configuration
    func configure(viewController: ClassifiedViewController)
    {
        router.classifiedViewController = viewController
        presenter.output = viewController
        interactor.output = presenter
        router.datasource = interactor
        viewController.requestClassified = interactor
        viewController.router = router
    }
}
