import Foundation
@testable import viperSample


class TodoDetailBuilder {
    var todoId: Int = 0
    var title: String = ""
    var detail: String = ""
    var isCompleted: Bool = false
    
    func withId(newValue: Int) -> Self {
        todoId = newValue
        return self
    }
    
    func withTitle(newValue: String) -> Self {
        title = newValue
        return self
    }
    
    func withDetail(newValue: String) -> Self {
        detail = newValue
        return self
    }
    
    func withIsCompleted(newValue: Bool) -> Self {
        isCompleted = newValue
        return self
    }
    
    func build() -> TodoDetail {
        return TodoDetail(
            todoId: self.todoId,
            title: self.title,
            detail: self.detail,
            isCompleted: self.isCompleted
        )
    }
}
