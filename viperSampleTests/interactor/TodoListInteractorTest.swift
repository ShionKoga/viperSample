import Foundation
@testable import viperSample
import Quick
import Nimble

class TodoListInteractorTest: QuickSpec {
    override func spec() {
        var interactor: DefaultTodoListInteractor!
        
        beforeEach {
            interactor = DefaultTodoListInteractor()
        }
        
        context("getAllTodo") {
            var spyPresenterDelegate: SpyPresenterDelegate!
            beforeEach {
                spyPresenterDelegate = SpyPresenterDelegate()
                interactor.presenterDelegate = spyPresenterDelegate
            }
            
            it("passes todos in TodoStore to presenterDelegate setData") {
                interactor.getAllTodo()
                
                
                expect(spyPresenterDelegate.setData_argument_todoList).to(equal(TodoStore.shared.todos))
            }
        }
    }
}
