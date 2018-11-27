//
//  Datum.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

protocol UserProtocol {
    var id: Int { get set }
    var firstName: String { get set }
    var lastName: String { get set }
    var avatar: String { get set }
}

class User: UserProtocol, Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
    
    init(id: Int, firstName: String, lastName: String, avatar: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
    }
}
