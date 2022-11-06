import UIKit

protocol TodoListRouterProtocol: AnyObject {
    static func assembleModules() -> UIViewController
    
    var view: TodoListViewProtocol? { get set }
    
    func transitionToDetailView(_ todoId: Int)
}

final class TodoListRouter: TodoListRouterProtocol {
    
    weak var view: TodoListViewProtocol?
    
    static func assembleModules() -> UIViewController {
        let view = TodoListViewController()
        let presenter = TodoListPresenter()
        let interactor = TodoListInteractor()
        let router = TodoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
    func transitionToDetailView(_ todoId: Int) {
        let detailView = TodoDetailRouter.assembleModules(todoId)
        self.view?.pushViewController(detailView, animated: true)
    }
}
