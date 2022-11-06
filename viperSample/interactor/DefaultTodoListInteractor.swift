import Foundation


protocol PresenterDelegate: AnyObject {
    func setData(_ todoList: [Todo])
}

final class DefaultTodoListInteractor: TodoListInteractor {
    
    weak var presenterDelegate: PresenterDelegate?
    
    func getAllTodo() {
        let todoList = TodoStore.shared.todos
        self.presenterDelegate?.setData(todoList)
    }
}
