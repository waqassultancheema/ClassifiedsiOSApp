//
//  ServiceApi.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation



public class ServiceApi:WebAPIHandler {
    
    
    static let shared = ServiceApi()
    let cache = LRUCache<String,Data>(capacity: 3)
    var task: URLSessionTask!
    var session = URLSession.shared

    func getDataFromServer(url: String, withMethod method: URLMethod?, completion: @escaping onCompletion) -> URLSessionTask? {
        
        guard Reachability.isConnectedToNetwork() else {
            completion(nil, NetworkError.noNetwork)
            return nil
        }
        
        let urlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        
        
        if let urL = URL(string: urlString) {
            var request = URLRequest(url: urL)
            if let method = method {
                request.httpMethod = method.rawValue
            }
            
          
            let task = session.dataTask(with: request) { (data, response, error) -> Void in
                ParserURLResponse.parseURLResponse(response: response, data: data, completion: completion,error: error)
            }
            task.resume()
            return task
        }
        return nil
    }
    
    
   
    
    func getData(url: String, withMethod method: URLMethod?,completion: @escaping onCompletion) {
        
        if let response = cache.getValue(for: url) {
            completion(response, nil)
        } else {
          task =   getDataFromServer(url: url, withMethod: method) { [unowned self] (data, error) in
                
                
                guard error == nil else {
                    completion(nil,error)
                    return
                }
                self.cache.setValue(data as! Data, for: url)
                completion(data,error)
            }
            
        }
        
    }
    
    func cancelRequest() {
        self.task.cancel()
    }
    
    
}
