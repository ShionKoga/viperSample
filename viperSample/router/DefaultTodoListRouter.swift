import UIKit

protocol TransitionProtocol: AnyObject {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func popToRootViewController(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void))
}

final class DefaultTodoListRouter: TodoListRouter {
    
    weak var view: TransitionProtocol?
    
    static func assembleModules() -> UIViewController {
        let view = TodoListViewController()
        let presenter = DefaultTodoListPresenter()
        let interactor = DefaultTodoListInteractor()
        let router = DefaultTodoListRouter()
        
        view.presenter = presenter
        presenter.reloadable = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenterDelegate = presenter
        router.view = view
        
        return view
    }
    
    func transitionToDetailView(_ todoId: Int) {
        let detailView = DefaultTodoDetailRouter.assembleModules(todoId)
        self.view?.pushViewController(detailView, animated: true)
    }
}
