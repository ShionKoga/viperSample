import Foundation

protocol TodoListInteractor: AnyObject {
    func getAllTodo()
}

protocol TodoListRouter: AnyObject {
    func transitionToDetailView(_ todoId: Int)
}

final class DefaultTodoListPresenter: TodoListPresenter {
    weak var reloadable: Reloadable?
    var interactor: TodoListInteractor?
    var router: TodoListRouter?
    
    var todoOverviews = [TodoOverview]()
    
    func viewWillAppear() {
        self.interactor?.getAllTodo()
    }
    
    func didSelectRow(at index: Int) {
        let todoId = self.todoOverviews[index].todoId
        self.router?.transitionToDetailView(todoId)
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

extension DefaultTodoListPresenter: PresenterDelegate {
    func setData(_ todoList: [Todo]) {
        let todoOverviews = todoList.map { todo in
            return TodoOverview(todoId: todo.id, title: todo.title)
        }
        self.todoOverviews = todoOverviews
        self.reloadable?.reload()
    }
}
