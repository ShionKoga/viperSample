import Foundation
import UIKit
@testable import viperSample
import Quick
import Nimble

class TodoListViewControllerTest: QuickSpec {
    override func spec() {
        describe("TodoListViewController") {
            var todoListViewController: TodoListViewController!
            var spyPresenter: SpyTodoListPrsenter!
            var spyTableView: SpyTableView!
            
            beforeEach {
                todoListViewController = TodoListViewController()
                spyPresenter = SpyTodoListPrsenter()
                spyTableView = SpyTableView()
                todoListViewController.presenter = spyPresenter
                todoListViewController.tableView = spyTableView
            }
            
            context("viewDidLoad") {
                beforeEach {
                    todoListViewController.loadViewIfNeeded()
                }
                
                it("sets title 'Todo List'") {
                    expect(todoListViewController.title).to(equal("Todo List"))
                }
                
                it("sets dataSource of tableView") {
                    expect(spyTableView.dataSource).toNot(beNil())
                    expect(spyTableView.dataSource is TodoListViewController).to(beTrue())
                }
                
                it("sets delegate of tableView") {
                    expect(spyTableView.delegate).toNot(beNil())
                    expect(spyTableView.delegate is TodoListViewController).to(beTrue())
                }
                
                it("adds tableView to view as subviews") {
                    let subViews = todoListViewController.view.subviews
                    let tableView = subViews.compactMap { $0 as? UITableView }.first
                    expect(tableView).to(equal(spyTableView))
                }
            }
            
            context("viewWillAppear") {
                it("calls presenter viewWillAppear") {
                    todoListViewController.beginAppearanceTransition(true, animated: false)
                    expect(spyPresenter.viewWillAppear_wasCalled).to(beTrue())
                }
            }
            
            context("showTodoOverview") {
                it("sets TodoOverview and then calls tableView reloadData") {
                    todoListViewController.showTodoOverview([])
                    
                    
                    expect(spyTableView.reloadData_wasCalled).to(beTrue())
                }
            }
            
            context("tableView numberOfRowsInSection") {
                it("returns count of todoOverviews") {
                    let todoOverviews = [
                        TodoOverview(todoId: 0, title: ""),
                        TodoOverview(todoId: 0, title: ""),
                    ]
                    todoListViewController.showTodoOverview(todoOverviews)
                    
                    
                    let rowsCount = todoListViewController.tableView(spyTableView, numberOfRowsInSection: 0)
                    
                    expect(rowsCount).to(equal(2))
                }
            }
            
            context("tableView cellForRowAt") {
                it("returns cell that displays todoOverview title") {
                    let todoOverviews = [
                        TodoOverview(todoId: 0, title: "hoge"),
                        TodoOverview(todoId: 0, title: "fuga"),
                    ]
                    todoListViewController.showTodoOverview(todoOverviews)
                    todoListViewController.loadViewIfNeeded()
                    
                    
                    let firstCell = todoListViewController.tableView(spyTableView, cellForRowAt: IndexPath(row: 0, section: 0))
                    let secondCell = todoListViewController.tableView(spyTableView, cellForRowAt: IndexPath(row: 1, section: 0))
                    
                    expect(firstCell.textLabel?.text).to(equal("hoge"))
                    expect(secondCell.textLabel?.text).to(equal("fuga"))
                }
            }
            
            context("tableView didSelectRowAt") {
                it("passes correct argument to presenter didSelectRowAt") {
                    let todoOverviews = [
                        TodoOverview(todoId: 0, title: ""),
                    ]
                    todoListViewController.showTodoOverview(todoOverviews)
                    
                    
                    todoListViewController.tableView(spyTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
                    
                    expect(spyPresenter.didSelectRowAt_argument_at).to(equal(0))
                }
            }
        }
    }
}
