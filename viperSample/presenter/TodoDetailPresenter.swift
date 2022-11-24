import UIKit

protocol TodoDetailUseCase: AnyObject {
    func fetchTodo(_ todoId: Int)
}

protocol TodoDetailView: AnyObject {
    func showDetaildata(_ todo: TodoDetail)
}

final class TodoDetailPresenter: TodoDetailPresentation {
    weak var view: TodoDetailView?
    var interactor: TodoDetailUseCase!
    
    var todoId: Int = 0
    
    private var todo: TodoDetail = TodoDetail(
        todoId: 0,
        title: "",
        detail: "",
        isCompleted: false
    ) {
        didSet {
            self.view?.showDetaildata(todo)
        }
    }
    
    func viewWillAppear() {
        self.interactor.fetchTodo(self.todoId)
    }
    
    func getTodoDetail() -> TodoDetail {
        return todo
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutput {
    func setData(_ todo: Todo) {
        let viewData = TodoDetail(
            todoId: todo.id,
            title: todo.title,
            detail: todo.detail,
            isCompleted: todo.isCompleted
        )
        self.todo = viewData
    }
}
