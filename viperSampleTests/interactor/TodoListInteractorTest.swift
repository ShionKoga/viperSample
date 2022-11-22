import Foundation
@testable import viperSample
import Quick
import Nimble

class TodoListInteractorTest: QuickSpec {
    override func spec() {
        var interactor: TodoListInteractor!
        
        beforeEach {
            interactor = TodoListInteractor()
        }
        
        context("getAllTodo") {
            var spyTodoListPresenter: SpyTodoListPrsenter!
            beforeEach {
                spyTodoListPresenter = SpyTodoListPrsenter()
                interactor.output = spyTodoListPresenter
            }
            
            it("passes todos in TodoStore to presenterDelegate setData") {
                interactor.getAllTodo()
                
                
                expect(spyTodoListPresenter.setData_argument_todoList).to(equal(TodoStore.shared.todos))
            }
        }
    }
}
