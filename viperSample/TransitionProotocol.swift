import UIKit

extension TransitionProtocol where Self: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)) {
        self.dismiss(animated: animated, completion: completion)
    }
}
