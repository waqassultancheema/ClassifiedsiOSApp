//
//  ClassifiedDetailConfigurator.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

extension ClassifiedDetailViewController: ClassifiedDetailPresenterOutput
{
    func successFetchedClassifiedDetail(viewModel: ViewModel.DisplayViewModel.ClassifiedViewModel) {
        self.displayFetchClassifiedDetail(viewModel: viewModel)
    }
}


extension ClassifiedDetailPresenter: ClassifiedDetailInteractorOutput
{
    func passedToPresenterFetchedClassified(classified: Classified) {
        self.presentFetchClassifiedDetail(classified: classified)
    }
}

class ClassifiedDetailConfigurator: NSObject {

    let presenter = ClassifiedDetailPresenter()
    let interactor = ClassifiedDetailInteractor()
    
    // MARK: - Configuration
    func configure(viewController: ClassifiedDetailViewController)
    {
        presenter.output = viewController
        interactor.output = presenter
    }
}
