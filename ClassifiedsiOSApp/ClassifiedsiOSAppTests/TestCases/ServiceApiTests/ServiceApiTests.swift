//
//  ServiceApiTests.swift
//  ClassifiedsiOSAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ClassifiedsiOSApp

class ServiceApiTests: XCTestCase {
    
    var sut:ServiceApi = ServiceApi()
    //var sutArticlesViewController:StubArticlesViewController?
    var jsonArticlessDictionaryStub : Dictionary<String,AnyObject>!
    var worker: ClassifiedRemoteWorkerProtocol!
    
    override func setUp() {
        super.setUp()
        worker = ClassifiedRemoteWorker(serviceApi: sut)
        jsonArticlessDictionaryStub = loadJSONDictionaryFromBundle(withName: "Classifieds", extension: "json")
        sut.session = StubURLSession()
    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonArticlessDictionaryStub)
    }
    
    func testServiceNoInternetError() {
        DummyReachability.isConnected = false
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.ClassifiedRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        worker.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (article) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)
            
        })
    }
    
    func testServiceResumeCalled() {
        DummyReachability.isConnected = true
        
        worker.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (article) in
        }, failure: { (error) in
        })
        XCTAssertTrue((sut.task as! StubURLSessionDataTask).resumeWasCalled)
        
    }
    
    func testShouldReturnCorrectResult() {
        DummyReachability.isConnected = true
        
        let jsonString:String = jsonArticlessDictionaryStub.jsonStringRepresentation!
        let session = sut.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.ClassifiedRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (article) in
            XCTAssertNotNil(article)
        }, failure: { (error) in
            XCTFail()
        })
        
        
        
    }
    
    func testShouldReturnErrorOfNSURLErrorTimedOut() {
        DummyReachability.isConnected = true
        let jsonString:String = jsonArticlessDictionaryStub.jsonStringRepresentation!
        let session = sut.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.ClassifiedRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: URLError.timedOut.rawValue , httpVersion: "HTTP/1.1", headerFields: nil)
        worker.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (article) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)

        })
    }
    
    
    func testShouldReturnErrorWithDataNil() {
        DummyReachability.isConnected = true
        
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.ClassifiedRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        worker.fetchClassifieds(request: Request.Fetch.ClassifiedRequest(), complete: { (article) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)
        })
    }
    
    func testShouldReturnErrorOfCancelRequest() {
        DummyReachability.isConnected = true
        
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.ClassifiedRequest()
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
       sut.task = sut.getDataFromServer(url: request.mURL, withMethod: .GET) { (value, error) in
            
        }
        sut.cancelRequest()
        
        XCTAssertEqual((sut.task as! StubURLSessionDataTask).cancelWasCalled, true)
        
        
    }
}
