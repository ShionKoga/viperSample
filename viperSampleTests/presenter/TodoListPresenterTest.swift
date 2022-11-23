import Quick
import Nimble
import Foundation
@testable import viperSample

class TodoListPresenterTest: QuickSpec {
    override func spec() {
        describe("DefaultTodoListPresenter") {
            var presenter: TodoListPresenter!
            
            beforeEach {
                presenter = TodoListPresenter()
            }
            
            context("viewWillAppear") {
                var spyInteractor: SpyTodoListInteractor!
                
                beforeEach {
                    spyInteractor = SpyTodoListInteractor()
                    presenter.interactor = spyInteractor
                }
                
                it("calls interactor getAllTodo") {
                    presenter.viewWillAppear()
                    
                    
                    expect(spyInteractor.getAllTodo_wasCalled).to(beTrue())
                }
            }
            
            context("didSelectRowAt") {
                var spyRouter: SpyTodoListRouter!
                
                beforeEach {
                    spyRouter = SpyTodoListRouter()
                    presenter.router = spyRouter
                }
                
                it("passes correct todoId as argument to router transitionToDetailView") {
                    presenter.setData([
                        TodoBuilder().withId(2).build()
                    ])
                    
                    
                    presenter.didSelectRow(at: 0)
                    
                    
                    expect(spyRouter.transitionToDetailView_argument_todoId).to(equal(2))
                }
            }
            
            context("setData") {
                it("passes correct data to view") {
                    let spyTodoListView = SpyTodoListViewController()
                    presenter.view = spyTodoListView
                    
                    presenter.setData([Todo.default])
                    
                    expect(spyTodoListView.showTodoOverview_argument_todoOverview).to(equal([TodoOverview(todoId: 0, title: "")]))
                }
            }
        }
    }
}
