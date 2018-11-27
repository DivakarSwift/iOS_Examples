//
//  UserDetailViewModel.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

protocol UserDetailViewModelProtocol: ViewModel {
    var firstName: String { get }
    var secondName: String { get }
    var avatarUrl: URL? { get }
}

class UserDetailViewModel: BaseViewModel, UserDetailViewModelProtocol {
    
    var user: UserProtocol
    
    init(user: UserProtocol) {
        self.user = user
        super.init()
    }
    
    var firstName: String {
        return user.firstName
    }
    
    var secondName: String {
        return user.lastName
    }
    
    var avatarUrl: URL? {
        return URL(string: user.avatar)
    }
    
}
