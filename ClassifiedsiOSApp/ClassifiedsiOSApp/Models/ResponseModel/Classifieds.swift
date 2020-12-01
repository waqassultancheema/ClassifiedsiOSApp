//
//  Result.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//
import Foundation

// MARK: - Classifieds
class Classifieds: Codable {
    let results: [Classified]?

    init(results: [Classified]?) {
        self.results = results
    }
}

// MARK: Classifieds convenience initializers and mutators

extension Classifieds {
    convenience init(data: Data) throws {
        let me = try JSONDecoder().decode(Classifieds.self, from: data)
        self.init(results: me.results)
    }

    convenience init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    convenience init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(results: [Classified]?? = nil) -> Classifieds {
        return Classifieds(results: results ?? self.results)
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
    
     convenience init(_ jsonDic: Dictionary<String,AnyObject>) throws {
         let jsonData = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
         try self.init(data: jsonData)
         
     }
}
