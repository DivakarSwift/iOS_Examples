//
//  NetworkManager.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

enum Result<Value, Error> {
    case success(Value)
    case failure(Error)
}

typealias SuccessCompletion = (Result<Bool, Error>) -> Void
typealias ListUsersCompletion = (Result<ListUser, Error>) -> Void

protocol NetworkManagerProtocol:
         UserNetworkManager {}

protocol UserNetworkManager {
    func getListUsers(page: Int, completion: @escaping ListUsersCompletion)
}
