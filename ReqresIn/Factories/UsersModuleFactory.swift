//
//  UsersModuleFactory.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

protocol UsersModuleFactory {
    func makeListUsersOutput() -> ListUsersView
    func makeUserDetailOutput(user: UserProtocol) -> UserDetailView

}
