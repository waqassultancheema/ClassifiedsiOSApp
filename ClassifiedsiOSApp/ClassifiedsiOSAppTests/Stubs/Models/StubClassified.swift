//
//  StubResult.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/9/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import ClassifiedsiOSApp

class StubClassfied: Classified {

    static func dummyClassified() -> StubClassfied  {
        return  StubClassfied(createdAt: "test date", price: "12", name: "test", uid: "123", imageIDS: nil, imageUrls: ["test"], imageUrlsThumbnails: ["test"])
    }
}
