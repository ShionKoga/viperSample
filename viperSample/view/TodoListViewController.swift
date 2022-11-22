import UIKit

protocol TodoListPresentation: AnyObject {
    func viewWillAppear()
    func didSelectRow(at todoId: Int)
    func getTodoCount() -> Int
    func getTodoOverview(at index: Int) -> TodoOverview?
}

final class TodoListViewController: UITableViewController {
    var presenter: TodoListPresenter!
    var todoOverviews: [TodoOverview] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        title = "Todo List"
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoListTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.viewWillAppear()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presenter = self.presenter else { return 0}
        return presenter.getTodoCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath)
        guard let presenter = self.presenter else { return cell }
        guard let todoOverview = presenter.getTodoOverview(at: indexPath.row) else { return cell }
        cell.textLabel?.text = todoOverview.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelectRow(at: indexPath.row)
    }
}

extension TodoListViewController: TodoListView {
    func showTodoOverview(_ todoOverviews: [TodoOverview]) {
        self.todoOverviews = todoOverviews
    }
}

extension TodoListViewController: TransitionProtocol {}
