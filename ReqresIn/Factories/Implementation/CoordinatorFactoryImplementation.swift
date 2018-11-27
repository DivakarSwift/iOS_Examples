import UIKit
import Foundation

final class CoordinatorFactoryImplementation: CoordinatorFactory {

    func makeUsersCoordinatorOutput(router: Router) -> (configurator: Coordinator & UsersCoordinatorOutput, toPresent: Presentable?) {
        let coordinator = UsersCoordinator(coordinatorFactory: CoordinatorFactoryImplementation(), factory: ModuleFactoryImplementation(), router: router)

        let controller = ModuleFactoryImplementation().makeListUsersOutput().toPresent()
        return (coordinator, controller)
    }
  
    private func router(_ navController: UINavigationController?) -> Router {
        return RouterImplementation(rootController: navigationController(navController))
    }
  
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController.controllerFromStoryboard(.main) }
    }
}
