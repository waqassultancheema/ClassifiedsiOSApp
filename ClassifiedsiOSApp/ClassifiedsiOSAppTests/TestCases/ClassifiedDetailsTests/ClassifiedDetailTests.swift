//
//  ClassifiedDetailTests.swift
//  ClassifiedsDemoAppTests
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ClassifiedsiOSApp

class ClassifiedDetailTests: XCTestCase {

    var jsonClassifiedDictionaryStub : Dictionary<String,AnyObject>!

    override func setUp() {
        super.setUp()
        jsonClassifiedDictionaryStub = loadJSONDictionaryFromBundle(withName: "Classified", extension: "json")
    }

    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonClassifiedDictionaryStub)
    }
    
    func testShouldCreateClassifiedFromDictionary()  {
        if  let firstClassifiedJson = jsonClassifiedDictionaryStub {
        do {
            let classified = try Classified(firstClassifiedJson)
             XCTAssertNotNil(classified)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
        }

    }
    func testShouldGetName() {
        if  let firstClassifiedJson = jsonClassifiedDictionaryStub {
            do {
                let classified = try Classified(firstClassifiedJson)
                XCTAssertNotNil(classified.name)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
    }

    func testShouldGetPrice() {
        if  let firstClassifiedJson = jsonClassifiedDictionaryStub {
            do {
                let classified = try Classified(firstClassifiedJson)
                XCTAssertNotNil(classified.price)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
    }

    func testShouldGetCreatedAt() {
        if  let firstClassifiedJson = jsonClassifiedDictionaryStub {
            do {
                let classified = try Classified(firstClassifiedJson)
                XCTAssertNotNil(classified.createdAt)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
    }
}
