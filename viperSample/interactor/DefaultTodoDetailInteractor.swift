import Foundation

protocol TodoDetailPresenterDelegate: AnyObject {
    func setData(_ todo: Todo)
}

final class DefaultTodoDetailInteractor: TodoDetailInteractor {
    weak var presenterDelegate: TodoDetailPresenterDelegate?
    
    func fetchTodo(_ todoId: Int) {
        let todo = TodoStore.shared.todos.first { $0.id == todoId } ?? Todo.default
        self.presenterDelegate?.setData(todo)
    }
}
