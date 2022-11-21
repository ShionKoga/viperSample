import Foundation
@testable import viperSample

class SpyTodoListInteractor: TodoListInteractor {
    var getAllTodo_wasCalled: Bool = false
    func getAllTodo() {
        getAllTodo_wasCalled = true
    }
}
