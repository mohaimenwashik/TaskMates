//
//  Tasks.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/14/24.
//

import Foundation
import SwiftData

@Model
class Tasks {
    var tasks: String
    var priority: Int
    var dueDate: Date
    var onCompleted: Bool
    @Relationship(deleteRule: .cascade) var roomate = [Roomates]()
    
    init(tasks: String = "", priority: Int = 2, dueDate: Date = .now, onCompleted: Bool = false) {
        self.tasks = tasks
        self.priority = priority
        self.dueDate = dueDate
        self.onCompleted = onCompleted
    }
}
