import UIKit
import Foundation

protocol CoordinatorFactory {
    func makeUsersCoordinatorOutput(router: Router) -> (configurator: Coordinator & UsersCoordinatorOutput, toPresent: Presentable?)
}
