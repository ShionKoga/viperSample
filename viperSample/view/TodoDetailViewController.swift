import UIKit

protocol TodoDetailPresenter: AnyObject {
    func viewWillAppear()
    func getTodoDetail() -> TodoDetail
}

final class TodoDetailViewController: UIViewController {
    var presenter: TodoDetailPresenter?
    
    let titleLabel: UILabel = UILabel()
    let detailLabel: UILabel = UILabel()
    let statusLabel: UILabel = UILabel()
    let deadLineLabel: UILabel = UILabel()
    
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
}

extension TodoDetailViewController: Reloadable {
    func reload() {
        guard let presenter = self.presenter else { return }
        let todoDetail = presenter.getTodoDetail()
        self.titleLabel.text = todoDetail.title
        self.detailLabel.text = todoDetail.detail
        self.statusLabel.text = todoDetail.isCompleted ? "完了" : "未完了"
        self.deadLineLabel.text = todoDetail.detail.description
    }
}
