import UIKit

protocol TodoDetailViewProtocol: TransitionProtocol {
    var presenter: TodoDetailPresenterProtocol? { get set }
    
    func showTodo(_ todo: TodoDetailViewData)
}

final class TodoDetailViewController: UIViewController, TodoDetailViewProtocol {
    var presenter: TodoDetailPresenterProtocol?
    
    let titleLabel: UILabel = UILabel()
    let detailLabel: UILabel = UILabel()
    let statusLabel: UILabel = UILabel()
    let deadLineLabel: UILabel = UILabel()
    
    var viewData = TodoDetailViewData(todoId: 0, title: "", detail: "", isCompleted: false, deadLine: Date()) {
        didSet {
            self.titleLabel.text = self.viewData.title
            self.detailLabel.text = self.viewData.detail
            self.statusLabel.text = self.viewData.isCompleted ? "完了" : "未完了"
            self.deadLineLabel.text = self.viewData.detail.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter?.viewWillAppear()
    }
    
    override func viewDidLayoutSubviews() {
        let safeArea = view.safeAreaInsets
        
        titleLabel.frame = CGRect(x: 0, y: safeArea.top, width: view.frame.width, height: 50)
        detailLabel.frame = CGRect(x: 0, y: safeArea.top + 50, width: view.frame.width, height: 50)
        statusLabel.frame = CGRect(x: 0, y: safeArea.top + 100, width: view.frame.width, height: 50)
        deadLineLabel.frame = CGRect(x: 0, y: safeArea.top + 150, width: view.frame.width, height: 50)
        
        view.addSubview(titleLabel)
        view.addSubview(detailLabel)
        view.addSubview(statusLabel)
        view.addSubview(deadLineLabel)
    }
    
    func showTodo(_ todo: TodoDetailViewData) {
        self.viewData = todo
    }
}
