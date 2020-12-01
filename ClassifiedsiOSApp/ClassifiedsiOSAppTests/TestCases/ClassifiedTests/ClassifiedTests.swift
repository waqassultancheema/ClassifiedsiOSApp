//
//  ClassifiedsTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ClassifiedsiOSApp

class ClassfiedsTests: XCTestCase {

    var jsonClassifiedssDictionaryStub : Dictionary<String,AnyObject>!

    override func setUp() {
        super.setUp()
        jsonClassifiedssDictionaryStub = loadJSONDictionaryFromBundle(withName: "Classifieds", extension: "json")
    }

    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonClassifiedssDictionaryStub)
    }

    func testShouldCreateClassifiedsFromDictionary()  {
        let firstClassifiedsJson = jsonClassifiedssDictionaryStub!
        do {
             let classifieds = try Classifieds(firstClassifiedsJson)
             XCTAssertNotNil(classifieds)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
    }
    
    func testShouldGetResults() {
        let firstClassifiedsJson = jsonClassifiedssDictionaryStub
        do {
            let classifieds = try Classifieds(firstClassifiedsJson!)
            XCTAssertNotNil(classifieds.results)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
    }
}
