import UIKit

protocol TodoDetailRouter: AnyObject {
    static func assembleModules(_ todoId: Int) -> UIViewController
}

final class DefaultTodoDetailRouter: TodoDetailRouter {
    
    static func assembleModules(_ todoId: Int) -> UIViewController {
        let view = TodoDetailViewController()
        let presenter = DefaultTodoDetailPresenter()
        let interactor = DefaultTodoDetailInteractor()
        
        view.presenter = presenter
        presenter.reloadable = view
        presenter.interactor = interactor
        interactor.presenterDelegate = presenter
        
        presenter.todoId = todoId
        
        return view
    }
}
