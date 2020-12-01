//
//  ClassifiedsPresenter.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


import UIKit

protocol ClassifiedsPresenterInput {
    func presentFetchClassifieds(classifieds: Classifieds)
    func presentFetchedError(error:String)
}
protocol ClassifiedsPresenterOutput: class {
    func successFetchedClassifieds(viewModel: ViewModel.DisplayViewModel)
    func errorWhileFetchingClassifieds(error:String)
}

class ClassifiedsPresenter:ClassifiedsPresenterInput {
    
    var output:ClassifiedsPresenterOutput!
    
    func presentFetchClassifieds(classifieds: Classifieds) {
        if let output  = output {
            let usersDisplayModel =  convertDataIntoViewModel(classifieds: classifieds)
            let viewModel = ViewModel.DisplayViewModel.init(classifieds: usersDisplayModel)
            output.successFetchedClassifieds(viewModel:viewModel)
        }
    }
    
    func presentFetchedError(error: String) {
        output.errorWhileFetchingClassifieds(error: error)
    }
    
    func convertDataIntoViewModel(classifieds: Classifieds) ->  [ViewModel.DisplayViewModel.ClassifiedViewModel] {
        
        var displayViewModels:[ViewModel.DisplayViewModel.ClassifiedViewModel] = []
        
        if let results = classifieds.results {
            for classified in results {
                
                var classifiedsViewModel:ViewModel.DisplayViewModel.ClassifiedViewModel = ViewModel.DisplayViewModel.ClassifiedViewModel()
                classifiedsViewModel.name  = classified.name ?? "NA"
                classifiedsViewModel.price = classified.price ?? "NA"
                classifiedsViewModel.imageLink  = classified.imageUrls?.first ?? ""
                displayViewModels.append(classifiedsViewModel)
            }
        }
        
        return displayViewModels
    }
}


