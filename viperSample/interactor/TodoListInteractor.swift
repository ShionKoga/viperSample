import Foundation


protocol TodoListInteractorOutput: AnyObject {
    func setData(_ todoList: [Todo])
}

final class TodoListInteractor: TodoListUseCase {
    
    weak var output: TodoListInteractorOutput?
    
    func getAllTodo() {
        let todoList = TodoStore.shared.todos
        self.output?.setData(todoList)
    }
}
