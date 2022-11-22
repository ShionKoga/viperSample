import Foundation
@testable import viperSample

class SpyTodoListViewController: TodoListView {
    var showTodoOverview_argument_todoOverview: [viperSample.TodoOverview]? = nil
    func showTodoOverview(_ todoOverviews: [viperSample.TodoOverview]) {
        showTodoOverview_argument_todoOverview = todoOverviews
    }
}
