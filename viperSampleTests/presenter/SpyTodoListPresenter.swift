import Foundation
@testable import viperSample

class SpyTodoListPrsenter: TodoListPresentation, TodoListInteractorOutput {
    var viewWillAppear_wasCalled: Bool = false
    func viewWillAppear() {
        viewWillAppear_wasCalled = true
    }
    
    var didSelectRowAt_argument_at: Int? = nil
    func didSelectRow(at todoId: Int) {
        didSelectRowAt_argument_at = todoId
    }
    
    var setData_argument_todoList: [Todo]? = nil
    func setData(_ todoList: [viperSample.Todo]) {
        setData_argument_todoList = todoList
    }
}

