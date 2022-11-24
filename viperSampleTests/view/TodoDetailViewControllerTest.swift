import UIKit
@testable import viperSample
import Nimble
import Quick

class TodoDetailViewControllerTest: QuickSpec {
    override func spec() {
        describe("TodoDetailViewController") {
            var spyPresenter: SpyTodoDetailPresenter!
            var todoDetailViewController: TodoDetailViewController!
            
            beforeEach {
                spyPresenter = SpyTodoDetailPresenter()
                todoDetailViewController = TodoDetailViewController()
                todoDetailViewController.presenter = spyPresenter
            }
            
            context("viewDIdLoad") {
                it("sets title 'Detail'") {
                    todoDetailViewController.loadViewIfNeeded()
                    
                    
                    expect(todoDetailViewController.title).to(equal("Detail"))
                }
            }
            
            context("viewWillAppear") {
                it("calls presenter viewWillAppear") {
                    todoDetailViewController.beginAppearanceTransition(true, animated: false)
                    
                    
                    expect(spyPresenter.viewWillAppear_wasCalled).to(beTrue())
                }
            }
            
            context("showDetailData") {
                it("displays TodoDetail title") {
                    todoDetailViewController.view.layoutIfNeeded()
                    
                    
                    todoDetailViewController.showDetaildata(
                        TodoDetailBuilder().withTitle(newValue: "title sample").build()
                    )
                    
                    let titleLabel = todoDetailViewController.view.subviews
                        .compactMap { $0 as? UILabel }
                        .first { $0.text == "title sample" }
                    expect(titleLabel).toNot(beNil())
                }
                
                it("displays TodoDetail detail") {
                    todoDetailViewController.view.layoutIfNeeded()
                    
                    
                    todoDetailViewController.showDetaildata(
                        TodoDetailBuilder().withDetail(newValue: "detail sample").build()
                    )
                    
                    let titleLabel = todoDetailViewController.view.subviews
                        .compactMap { $0 as? UILabel }
                        .first { $0.text == "detail sample" }
                    expect(titleLabel).toNot(beNil())
                }
                
                it("displays '完了' if isCompleted is true") {
                    todoDetailViewController.view.layoutIfNeeded()
                    
                    
                    todoDetailViewController.showDetaildata(
                        TodoDetailBuilder().withIsCompleted(newValue: true).build()
                    )
                    
                    let titleLabel = todoDetailViewController.view.subviews
                        .compactMap { $0 as? UILabel }
                        .first { $0.text == "完了" }
                    expect(titleLabel).toNot(beNil())
                }
                
                it("displays '未完了' if isCompleted is false") {
                    todoDetailViewController.view.layoutIfNeeded()
                    
                    
                    todoDetailViewController.showDetaildata(
                        TodoDetailBuilder().withIsCompleted(newValue: false).build()
                    )
                    
                    let titleLabel = todoDetailViewController.view.subviews
                        .compactMap { $0 as? UILabel }
                        .first { $0.text == "未完了" }
                    expect(titleLabel).toNot(beNil())
                }
            }
        }
    }
}
