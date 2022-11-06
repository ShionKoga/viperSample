import Foundation

class TodoStore {
    static let shared = TodoStore()
    
    private init() {}
    
    var todos: [Todo] = [
        Todo(id: 1, title: "カレーの具材を買う", detail: "カレールー・豚肉・じゃがいも・人参・玉ねぎはあるのでいらない。", isCompleted: false, deadLine: Date(), createdOn: Date(), updatedOn: Date()),
        Todo(id: 2, title: "歯医者の予約を取る", detail: "土曜の11：00ぐらい", isCompleted: true, deadLine: Date(), createdOn: Date(), updatedOn: Date()),
        Todo(id: 3, title: "友達に1000円返す", detail: "返さなくてもいいか", isCompleted: false, deadLine: Date(), createdOn: Date(), updatedOn: Date()),
        Todo(id: 4, title: "ブログを100記事書く", detail: "あと65記事", isCompleted: false, deadLine: Date(), createdOn: Date(), updatedOn: Date()),
        Todo(id: 5, title: "確定申告する", detail: "今年は4/16まで延期になった", isCompleted: false, deadLine: Date(), createdOn: Date(), updatedOn: Date())
    ]
}
