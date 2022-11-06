import Foundation

protocol TodoListPresenterProtocol: AnyObject {
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    func viewWillAppear()
    func didSelectRow(_ todoId: Int)
}

final class TodoListPresenter: TodoListPresenterProtocol {
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
    
    func viewWillAppear() {
        self.interactor?.fetchTodos()
    }
    
    func didSelectRow(_ todoId: Int) {
        self.router?.transitionToDetailView(todoId)
    }
}

extension TodoListPresenter: TodoListInteractorOutputProtocol {
    func didFetchedTodos(_ todos: [Todo]) {
        let viewDatas = todos.map { todo in
            return TodoListViewData(todoId: todo.id, title: todo.title)
        }
        self.view?.showTodos(viewDatas)
    }
}
