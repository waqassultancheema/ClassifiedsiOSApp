//
//  ArticlesViewModel.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

struct ViewModel {
    struct DisplayViewModel {
        struct ClassifiedViewModel {
            var name:String = ""
            var price:String = ""
            var imageLink:String = ""
        }
        var classifieds:[DisplayViewModel.ClassifiedViewModel]
    }
}
