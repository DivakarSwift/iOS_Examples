//
//  ModuleFactoryImplementation.swift
//  Holi
//
//  Created by Кирилл on 22.05.2018.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

import Foundation
class ModuleFactoryImplementation:
    UsersModuleFactory
{
    
    private let networkManager = NetworkManager()

    func makeListUsersOutput() -> ListUsersView {
        let model = ListUsersModel(dataManager: networkManager)
        let viewModel = ListUsersViewModel(model: model)
        let vc = ListUsersController()
        vc.viewModel = viewModel
        return vc
    }
    
    func makeUserDetailOutput(user: UserProtocol) -> UserDetailView {
        let viewModel = UserDetailViewModel(user: user)
        let vc = UserDetailController()
        vc.viewModel = viewModel
        return vc
    }
}
