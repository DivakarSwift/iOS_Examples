//
//  UsersCoordinator.swift
//  ReqresIn
//
//  Created by Кирилл on 11/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

class UsersCoordinator: BaseCoordinator, UsersCoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    private let factory: UsersModuleFactory
    
    init(coordinatorFactory: CoordinatorFactory, factory: UsersModuleFactory, router: Router) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        showListUser()
    }
    
    private func showListUser() {
        let listUsersOutput = factory.makeListUsersOutput()
        
        listUsersOutput.onUserSelected = {[weak self] user in
            self?.showUserDetail(user)
        }
        
        router.setRootModule(listUsersOutput, hideBar: false)
    }
    
    private func showUserDetail(_ user: UserProtocol) {
        let userDetailOutput = factory.makeUserDetailOutput(user: user)
        
        router.push(userDetailOutput)
    }
}
