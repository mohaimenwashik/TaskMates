//
//  ContentView.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
//    @Query var roomates: [Roomates]
    @State private var path = [Roomates]()
    @State private var pathToTask = [Tasks]()
    @State private var sortOrder = SortDescriptor(\Roomates.name)
    @State private var sortOrderTask = SortDescriptor(\Tasks.tasks)
    
    var body: some View {
        NavigationStack(path: $path) {
            RoomateListingView(sort: sortOrder)
                .navigationTitle("Roomates")
                .navigationDestination(for: Roomates.self, destination: EditRoomateView.init)
                .toolbar {
                    Button("Add Roomies", systemImage: "plus", action: addRoomies)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Ascending")
                                .tag(SortDescriptor(\Roomates.name))
                            
                            Text("Descending")
                                .tag(SortDescriptor(\Roomates.name, order: .reverse))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }   // NS
        
//        NavigationStack(path: $pathToTask) {
//            NavigationLink(destination: TasksListingView(sort: sortOrderTask)) {
//                Text("Tasks")
//            }
//            .navigationDestination(for: Tasks.self, destination: EditTasksView.init)
//        }
        
        NavigationStack(path: $pathToTask) {
            TasksListingView(sort: sortOrderTask)
                .navigationTitle("Tasks")
                .navigationDestination(for: Tasks.self, destination: EditTasksView.init)
                .toolbar {
                    Button("Add Tasks", action: addTask)
                }
        }
    }
    
    func addRoomies() {
        let roomate = Roomates()
        modelContext.insert(roomate)
        path = [roomate]
    }
    
    func addTask() {
        let task = Tasks()
        modelContext.insert(task)
        pathToTask = [task]
    }
    
}

#Preview {
    ContentView()
}
