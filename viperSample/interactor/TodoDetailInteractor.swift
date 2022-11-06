import Foundation

protocol TodoDetailInteractorInputProtocol: AnyObject {
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    func fetchTodo(_ todoId: Int)
}

protocol TodoDetailInteractorOutputProtocol: AnyObject {
    func didFetchedTodo(_ todo: Todo)
}

final class TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    var presenter: TodoDetailInteractorOutputProtocol?
    
    func fetchTodo(_ todoId: Int) {
        let todo = TodoStore.shared.todos.first { $0.id == todoId } ?? Todo.default
        self.presenter?.didFetchedTodo(todo)
    }
}
