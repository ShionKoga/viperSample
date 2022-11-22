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
            
            context("getTodoCount") {
                it("returns todo overviews count") {
                    presenter.setData([
                        Todo.default,
                        Todo.default
                    ])
                    
                    
                    let count = presenter.getTodoCount()
                    
                    
                    expect(count).to(equal(2))
                }
            }
            
            context("getTodoOverviewAt") {
                it("returns TodoOverview specified by index") {
                    presenter.setData([
                        TodoBuilder().withId(2).withTitle("hoge").build(),
                        TodoBuilder().withId(3).withTitle("fuga").build()
                    ])
                    
                    
                    let todoOverview = presenter.getTodoOverview(at: 1)
                    
                    
                    expect(todoOverview?.todoId).to(equal(3))
                    expect(todoOverview?.title).to(equal("fuga"))
                }
                
                it("returns nil when presenter has no todoOverview") {
                    presenter.setData([])
                    
                    
                    let result = presenter.getTodoOverview(at: 0)
                    
                    expect(result).to(beNil())
                }
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
                it("convert todo to todoOverview and set it as property") {
                    presenter.setData([
                        Todo(
                            id: 1,
                            title: "hoge",
                            detail: "",
                            isCompleted: false,
                            deadLine: Date(),
                            createdOn: Date(),
                            updatedOn: Date()
                        )
                    ])
                    
                    expect(presenter.getTodoCount()).to(equal(1))
                    expect(presenter.getTodoOverview(at: 0)?.todoId).to(equal(1))
                    expect(presenter.getTodoOverview(at: 0)?.title).to(equal("hoge"))
                }
                
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
