import Foundation
@testable import viperSample

class SpyPresenterDelegate: PresenterDelegate {
    var setData_argument_todoList: [Todo]? = nil
    func setData(_ todoList: [viperSample.Todo]) {
        setData_argument_todoList = todoList
    }
}

