//
//  EditTasksView.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/14/24.
//

import SwiftUI
import SwiftData

struct EditTasksView: View {
    @Bindable var tasks: Tasks
    
    var body: some View {
        Form {
            TextField("Task", text: $tasks.tasks)
//            TextField("Assigned to", text: $roomate.name)
            DatePicker("Due Date", selection: $tasks.dueDate)
            
            Section("Priority") {
                Picker("Priority", selection: $tasks.priority) {
                    Text("Low").tag(1)
                    Text("Medium").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(.segmented)
                
                Toggle(isOn: $tasks.onCompleted) {
                    Text("Progress")
                    }
                }
            
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Tasks.self, configurations: config)
        let example = Tasks(tasks: "Example Task", priority: 2, dueDate: .now)
//        let example2 = Roomates(name: "Example Name", phone: "1234567890")
        return EditTasksView(tasks: example/*, roomate: example2*/)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
