//
//  ClassifiedDetailPresenter.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ClassifiedDetailPresenterInput
{
    func presentFetchClassifiedDetail(classified: Classified)
}

protocol ClassifiedDetailPresenterOutput
{
    func successFetchedClassifiedDetail(viewModel: ViewModel.DisplayViewModel.ClassifiedViewModel)
}
class ClassifiedDetailPresenter: ClassifiedDetailPresenterInput {
    
    var output:ClassifiedDetailPresenterOutput!
    
    func presentFetchClassifiedDetail(classified: Classified) {
        var classifiedsViewModel:ViewModel.DisplayViewModel.ClassifiedViewModel = ViewModel.DisplayViewModel.ClassifiedViewModel()
        classifiedsViewModel.name  = classified.name ?? "NA"
        classifiedsViewModel.price = classified.price ?? "NA"
        classifiedsViewModel.imageLink  = classified.imageUrls?.first ?? ""
        output.successFetchedClassifiedDetail(viewModel: classifiedsViewModel)
    }
}

