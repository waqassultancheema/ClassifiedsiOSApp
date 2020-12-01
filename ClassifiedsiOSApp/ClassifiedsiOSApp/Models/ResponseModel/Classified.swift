//
//  Classified.swift
//  ClassifiedsiOSApp
//
//  Created by Waqas Sultan Home on 29/11/2020.
//

import Foundation

// MARK: - Classified
class Classified: Codable {
    let createdAt, price, name, uid: String?
    let imageIDS: [String]?
    let imageUrls, imageUrlsThumbnails: [String]?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }

    init(createdAt: String?, price: String?, name: String?, uid: String?, imageIDS: [String]?, imageUrls: [String]?, imageUrlsThumbnails: [String]?) {
        self.createdAt = createdAt
        self.price = price
        self.name = name
        self.uid = uid
        self.imageIDS = imageIDS
        self.imageUrls = imageUrls
        self.imageUrlsThumbnails = imageUrlsThumbnails
    }
}

// MARK: Classified convenience initializers and mutators

extension Classified {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Classified.self, from: data)
        self.init(createdAt: me.createdAt, price: me.price, name: me.name, uid: me.uid, imageIDS: me.imageIDS, imageUrls: me.imageUrls, imageUrlsThumbnails: me.imageUrlsThumbnails)
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

    func with(
        createdAt: String?? = nil,
        price: String?? = nil,
        name: String?? = nil,
        uid: String?? = nil,
        imageIDS: [String]?? = nil,
        imageUrls: [String]?? = nil,
        imageUrlsThumbnails: [String]?? = nil
    ) -> Classified {
        return Classified(
            createdAt: createdAt ?? self.createdAt,
            price: price ?? self.price,
            name: name ?? self.name,
            uid: uid ?? self.uid,
            imageIDS: imageIDS ?? self.imageIDS,
            imageUrls: imageUrls ?? self.imageUrls,
            imageUrlsThumbnails: imageUrlsThumbnails ?? self.imageUrlsThumbnails
        )
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
