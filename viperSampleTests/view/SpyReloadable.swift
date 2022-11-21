import Foundation
@testable import viperSample

class SpyReloadable: Reloadable {
    var reloadable_wasCalled: Bool = false
    func reload() {
        reloadable_wasCalled = true
    }
}
