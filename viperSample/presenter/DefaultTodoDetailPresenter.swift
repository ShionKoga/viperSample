import UIKit

protocol TodoDetailInteractor: AnyObject {
    func fetchTodo(_ todoId: Int)
}

final class DefaultTodoDetailPresenter: TodoDetailPresenter {
    weak var reloadable: Reloadable?
    var interactor: TodoDetailInteractor?
    
    var todoId: Int = 0
    
    private var todo: TodoDetail = TodoDetail(
        todoId: 0,
        title: "",
        detail: "",
        isCompleted: false,
        deadLine: Date()
    )
    
    func viewWillAppear() {
        self.interactor?.fetchTodo(self.todoId)
    }
    
    func getTodoDetail() -> TodoDetail {
        return todo
    }
}

extension DefaultTodoDetailPresenter: TodoDetailPresenterDelegate {
    func setData(_ todo: Todo) {
        let viewData = TodoDetail(
            todoId: todo.id,
            title: todo.title,
            detail: todo.detail,
            isCompleted: todo.isCompleted,
            deadLine: todo.deadLine
        )
        self.todo = viewData
        self.reloadable?.reload()
    }
}
