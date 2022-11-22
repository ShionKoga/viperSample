import UIKit

final class TodoDetailRouter {
    
    static func assembleModules(_ todoId: Int) -> UIViewController {
        let view = TodoDetailViewController()
        let presenter = TodoDetailPresenter()
        let interactor = TodoDetailInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        
        presenter.todoId = todoId
        
        return view
    }
}
