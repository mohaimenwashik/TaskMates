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
    
    init(tasks: String = "", priority: Int = 2, dueDate: Date = .now) {
        self.tasks = tasks
        self.priority = priority
        self.dueDate = dueDate
    }
}
