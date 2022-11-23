import UIKit

protocol TodoListPresentation: AnyObject {
    func viewWillAppear()
    func didSelectRow(at todoId: Int)
}

final class TodoListViewController: UIViewController {
    var presenter: TodoListPresentation!
    var tableView: UITableView!
    private var todoOverviews: [TodoOverview] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        title = "Todo List"
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoListTableViewCell")
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.viewWillAppear()
    }
}

extension TodoListViewController: TodoListView {
    func showTodoOverview(_ todoOverviews: [TodoOverview]) {
        self.todoOverviews = todoOverviews
    }
}

extension TodoListViewController: TransitionProtocol {}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoOverviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath)
        cell.textLabel?.text = todoOverviews[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.didSelectRow(at: indexPath.row)
    }
}
