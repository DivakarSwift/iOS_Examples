//
//  ReqresInProvider.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

enum ReqresInProvider {
    case listUsers(page: Int, perPage: Int)
}

extension ReqresInProvider: TargetType {
    
    fileprivate var keys: Constants.RestApi.Request.Type {
        return Constants.RestApi.Request.self
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://reqres.in/api") else {
            fatalError("FAILED: https://reqres.in/api")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .listUsers:
            return "/users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .listUsers:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .listUsers:
            return URLEncoding.default
        }
    }
    var task: Task {
        switch self {
        case .listUsers(let page, let perPage):
            let dict: [String: Any] = [keys.page: page, keys.perPage: perPage]
            return .requestParameters(parameters: dict, encoding: parameterEncoding)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
