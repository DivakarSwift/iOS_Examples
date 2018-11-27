//
//  ApplicationCoordinator.swift
//  Holi
//
//  Created by Кирилл on 9/27/18.
//  Copyright © 2018 Kirill Esin. All rights reserved.
//

final class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runUsersFlow()
    }
    
    private func runUsersFlow() {
        let (coordinator, module) = coordinatorFactory.makeUsersCoordinatorOutput(router: router)
        coordinator.parent = self
        addDependency(coordinator)
        router.setRootModule(module)
        coordinator.start()
        
    }
}
