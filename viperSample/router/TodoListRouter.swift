import UIKit

protocol TransitionProtocol: AnyObject {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func popToRootViewController(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void))
}

final class TodoListRouter: TodoListWireframe {
    
    weak var view: TransitionProtocol?
    
    static func assembleModules() -> UIViewController {
        let view = TodoListViewController()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        let router = TodoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.view = view
        
        return view
    }
    
    func transitionToDetailView(_ todoId: Int) {
        let detailView = TodoDetailRouter.assembleModules(todoId)
        self.view?.pushViewController(detailView, animated: true)
    }
}
