import Foundation
@testable import viperSample


class TodoBuilder {
    private var id: Int = 0
    private var title: String = ""
    private var detail: String = ""
    private var isCompleted: Bool = false
    private var deadLine: Date = Date()
    private var createdOn: Date = Date()
    private var updateOn: Date = Date()
    
    func withId(_ newValue: Int) -> Self {
        id = newValue
        return self
    }
    
    func withTitle(_ newValue: String) -> Self {
        title = newValue
        return self
    }
    
    func withDetail(_ newValue: String) -> Self {
        detail = newValue
        return self
    }
    
    func withIsCompleted(_ newValue: Bool) -> Self {
        isCompleted = newValue
        return self
    }
    
    func withDeadLine(_ newValue: Date) -> Self {
        deadLine = newValue
        return self
    }
    
    func withCreatedOn(_ newValue: Date) -> Self {
        createdOn = newValue
        return self
    }
    
    func withUpdateOn(_ newValue: Date) -> Self {
        updateOn = newValue
        return self
    }
    
    func build() -> Todo {
        return Todo(
            id: id,
            title: title,
            detail: detail,
            isCompleted: isCompleted,
            deadLine: deadLine,
            createdOn: createdOn,
            updatedOn: updateOn
        )
    }
}
