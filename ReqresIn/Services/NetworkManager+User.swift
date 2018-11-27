//
//  NetworkManager+User.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

let networkActivityPlugin = NetworkActivityPlugin { (activityType, targetType) in
    switch activityType {
    case .began:
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    case .ended:
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

struct NetworkManager: NetworkManagerProtocol {

    fileprivate var keys: Constants.RestApi.Request.Type {
        return Constants.RestApi.Request.self
    }
    
    let provider = MoyaProvider<ReqresInProvider>(plugins: [NetworkLoggerPlugin(verbose: true), networkActivityPlugin])
    
    func getListUsers(page: Int, completion: @escaping ListUsersCompletion) {
        provider.request(.listUsers(page: page, perPage: 6)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let listUsers = try JSONDecoder().decode(ListUser.self, from: response.data)
                    completion(.success(listUsers))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
