import UIKit


class SpyTableView: UITableView {
    var reloadData_wasCalled: Bool = false
    override func reloadData() {
        reloadData_wasCalled = true
    }
}
