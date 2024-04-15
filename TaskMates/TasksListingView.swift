//
//  TasksListingView.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/14/24.
//

import SwiftUI
import SwiftData

struct TasksListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Tasks.priority), SortDescriptor(\Tasks.dueDate, order: .reverse)]) var tasks: [Tasks]
//    @Bindable var roomate: Roomates
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                NavigationLink(value: task) {
                    VStack(alignment: .leading) {
                        Text(task.tasks)
                            .font(.headline)
                        
                        Text(task.dueDate.formatted(date: .long, time: .shortened))
//                            .toolbar {
//                                Button("Add Tasks", action: addTask)
//                            }
                    }
                }
            }
            .onDelete(perform: deleteTasks)
        }
    }
    
    init(sort: SortDescriptor<Tasks>) {
        _tasks = Query(sort: [sort])
//        _roomate = Roomates
    }
    
    func deleteTasks(_ indexSet: IndexSet) {
        for index in indexSet {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
    
    func addTask() {
        let task = Tasks()
        modelContext.insert(task)
    }
}

#Preview {
    TasksListingView(sort: SortDescriptor(\Tasks.priority))
}
