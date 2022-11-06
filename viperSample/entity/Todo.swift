import Foundation

struct Todo {
    let id: Int
    let title: String
    let detail: String
    let isCompleted: Bool
    let deadLine: Date
    let createdOn: Date
    let updatedOn: Date
    
    static let `default` = Todo(id: 0, title: "", detail: "", isCompleted: false, deadLine: Date(), createdOn: Date(), updatedOn: Date())
}
