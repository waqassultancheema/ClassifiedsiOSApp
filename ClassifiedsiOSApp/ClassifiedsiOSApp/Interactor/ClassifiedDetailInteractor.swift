//
//  ClassifiedDetailInteractor.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ClassifiedDetailInteractorInput {
    func getClassifiedDetail(classified: Classified)
}
protocol ClassifiedDetailInteractorOutput {
    func passedToPresenterFetchedClassified(classified: Classified)
}
class ClassifiedDetailInteractor:ClassifiedDetailInteractorInput {
    
    var output: ClassifiedDetailInteractorOutput!

    func getClassifiedDetail(classified: Classified) {
        self.output.passedToPresenterFetchedClassified(classified: classified)
    }
}
