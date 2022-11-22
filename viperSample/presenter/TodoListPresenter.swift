import Foundation

protocol TodoListUseCase: AnyObject {
    func getAllTodo()
}

protocol TodoListWireframe: AnyObject {
    func transitionToDetailView(_ todoId: Int)
}

protocol TodoListView: AnyObject {
    func showTodoOverview(_ todoOverviews: [TodoOverview])
}

final class TodoListPresenter: TodoListPresentation {
    weak var view: TodoListView?
    var interactor: TodoListUseCase!
    var router: TodoListWireframe!
    
    private var todoOverviews = [TodoOverview]() {
        didSet {
            self.view?.showTodoOverview(todoOverviews)
        }
    }
    
    func viewWillAppear() {
        self.interactor.getAllTodo()
    }
    
    func didSelectRow(at index: Int) {
        let todoId = self.todoOverviews[index].todoId
        self.router.transitionToDetailView(todoId)
    }
    
    func getTodoCount() -> Int {
        return todoOverviews.count
    }
    
    func getTodoOverview(at index: Int) -> TodoOverview? {
        if (todoOverviews.count == 0) {
            return nil
        }
        return todoOverviews[index]
    }
}

extension TodoListPresenter: TodoListInteractorOutput {
    func setData(_ todoList: [Todo]) {
        let todoOverviews = todoList.map { todo in
            return TodoOverview(todoId: todo.id, title: todo.title)
        }
        self.todoOverviews = todoOverviews
    }
}
