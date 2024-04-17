//
//  EditRoomateView.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/14/24.
//

import SwiftUI
import SwiftData

struct EditRoomateView: View {
    @Bindable var roomate: Roomates
//    @Bindable var tasks: Tasks
//    @Binding var taskER: String
//    @Binding var priorityER: Int
//    @Binding var dueDateER: Date
    @State private var newTasks = ""
//    @State private var sortOrder = SortDescriptor(\Tasks.priority)
    
    var body: some View {
            Form {
                HStack {
                    Text("Name: ")
                    TextField("Name", text: $roomate.name)
                }
                HStack {
                    Text("Phone Number: ")
                    TextField("Phone Number", text: $roomate.phone)
                }
                Section("Tasks") {

                    ForEach(roomate.tasks) { task in
                        NavigationLink(destination: EditTasksView(tasks: task)) {
                            Text("\(roomate.name) :  \(task.tasks) -> \(task.priority)")
                        }
                    }
                    
                    TextField("Add a new task for \(roomate.name)", text: $newTasks)
                    Button("Add Task", systemImage: "plus", action: addTasks)
                }
            }   //form
            .navigationTitle("Roomate Info")
            .navigationBarTitleDisplayMode(.inline)
    }
    
    func addTasks() {
        guard newTasks.isEmpty == false else { return }

        withAnimation {
            let task = Tasks(tasks: newTasks)
            roomate.tasks.append(task)
            newTasks = ""
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Roomates.self, configurations: config)
        let example = Roomates(name: "Example Date", phone: "1234567890")
        return EditRoomateView(roomate: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
