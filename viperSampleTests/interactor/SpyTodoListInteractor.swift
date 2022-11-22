import Foundation
@testable import viperSample

class SpyTodoListInteractor: TodoListUseCase {
    var getAllTodo_wasCalled: Bool = false
    func getAllTodo() {
        getAllTodo_wasCalled = true
    }
}
