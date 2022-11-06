import UIKit

protocol TodoDetailRouterProtocol: AnyObject {
    static func assembleModules(_ todoId: Int) -> UIViewController
    
    var view: TodoDetailViewProtocol? { get set }
}

final class TodoDetailRouter: TodoDetailRouterProtocol {
    
    weak var view: TodoDetailViewProtocol?
    
    static func assembleModules(_ todoId: Int) -> UIViewController {
        let view = TodoDetailViewController()
        let presenter = TodoDetailPresenter()
        let interactor = TodoDetailInteractor()
        let router = TodoDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        presenter.todoId = todoId
        
        return view
    }
}
