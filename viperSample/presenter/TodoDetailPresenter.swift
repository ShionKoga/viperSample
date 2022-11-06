import UIKit

protocol TodoDetailPresenterProtocol: AnyObject {
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    func viewWillAppear()
}

final class TodoDetailPresenter: TodoDetailPresenterProtocol {
    var view: TodoDetailViewProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    var router: TodoDetailRouterProtocol?
    
    var todoId: Int = 0
    
    func viewWillAppear() {
        self.interactor?.fetchTodo(self.todoId)
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didFetchedTodo(_ todo: Todo) {
        let viewData = TodoDetailViewData(
            todoId: todo.id,
            title: todo.title,
            detail: todo.detail,
            isCompleted: todo.isCompleted,
            deadLine: todo.deadLine
        )
        self.view?.showTodo(viewData)
    }
}
