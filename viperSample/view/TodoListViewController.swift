import UIKit

protocol TodoListViewProtocol: TransitionProtocol {
    var presenter: TodoListPresenterProtocol? { get set }
    func showTodos(_ todos: [TodoListViewData])
}

final class TodoListViewController: UITableViewController, TodoListViewProtocol {
    var presenter: TodoListPresenterProtocol?
    var viewDatas = [TodoListViewData]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "Todo List"
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoListTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListTableViewCell", for: indexPath)
        cell.textLabel?.text = self.viewDatas[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoId = self.viewDatas[indexPath.row].todoId
        self.presenter?.didSelectRow(todoId)
    }
    
    func showTodos(_ todos: [TodoListViewData]) {
        self.viewDatas = todos
    }
}
