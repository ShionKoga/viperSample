import Foundation
@testable import viperSample

class SpyTodoDetailPresenter: TodoDetailPresentation {
    var viewWillAppear_wasCalled: Bool = false
    func viewWillAppear() {
        viewWillAppear_wasCalled = true
    }
}
