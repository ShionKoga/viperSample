import Foundation

protocol TodoDetailInteractorOutput: AnyObject {
    func setData(_ todo: Todo)
}

final class TodoDetailInteractor: TodoDetailUseCase {
    weak var output: TodoDetailInteractorOutput?
    
    func fetchTodo(_ todoId: Int) {
        let todo = TodoStore.shared.todos.first { $0.id == todoId } ?? Todo.default
        self.output?.setData(todo)
    }
}
