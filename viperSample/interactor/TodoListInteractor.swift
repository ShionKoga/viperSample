import Foundation

protocol TodoListInteractorInputProtocol: AnyObject {
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    func fetchTodos()
}

protocol TodoListInteractorOutputProtocol: AnyObject {
    func didFetchedTodos(_ todos: [Todo])
}

final class TodoListInteractor: TodoListInteractorInputProtocol {
    
    var presenter: TodoListInteractorOutputProtocol?
    
    func fetchTodos() {
        let todos = TodoStore.shared.todos
        self.presenter?.didFetchedTodos(todos)
    }
}
