//
//  ClassifiedRemoteWorkerTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ClassifiedsiOSApp

class ClassifiedRemoteWorkerTests: XCTestCase {
    
    var sut: ClassifiedRemoteWorkerProtocol?
    var jsonClassifiedssDictionaryStub : Dictionary<String,AnyObject>!
    var stubSerivceApi:StubServiceApi = StubServiceApi()
    
    override func setUp() {
        super.setUp()
        jsonClassifiedssDictionaryStub = loadJSONDictionaryFromBundle(withName: "Classifieds", extension: "json")
        sut = ClassifiedRemoteWorker(serviceApi: stubSerivceApi)
        stubSerivceApi.session = StubURLSession()
        sut?.serviceApi = stubSerivceApi
    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonClassifiedssDictionaryStub)
    }
    
    func testShouldReturnClassifieds() {
        DummyReachability.isConnected = true

        let jsonString:String = jsonClassifiedssDictionaryStub.jsonStringRepresentation!
         let session = stubSerivceApi.session as! StubURLSession
            session.nextData = jsonString.data(using: .utf8)
            let request = Request.Fetch.ClassifiedRequest()
            session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
            sut?.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (classifieds) in
                XCTAssertNotNil(classifieds)
            }, failure: { (error) in
                XCTFail()
            })
    }
    
    func testShouldReturnErrorOfMappingClassifieds() {
        DummyReachability.isConnected = true
        let session = stubSerivceApi.session as! StubURLSession
        session.nextData = "".data(using: .utf8)
        let request = Request.Fetch.ClassifiedRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        sut?.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (Classified) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertEqual(error, "The data couldn’t be read because it isn’t in the correct format.")
        })
    }
}
