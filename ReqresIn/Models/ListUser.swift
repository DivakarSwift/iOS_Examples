//
//  User.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

protocol ListUserProtocol {
    var page: Int { get set }
    var perPage: Int { get set }
    var total: Int { get set }
    var totalPages: Int { get set }
    var users: [User] { get set }
}

class ListUser: ListUserProtocol, Codable {
    
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var users: [User]
    
    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case users = "data"
    }
    
    init(page: Int, perPage: Int, total: Int, totalPages: Int, users: [User]) {
        self.page = page
        self.perPage = perPage
        self.total = total
        self.totalPages = totalPages
        self.users = users
    }
}
