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
    @Query var grocery: [GroceryList]
    @State private var path = [Roomates]()
    @State private var pathToTask = [Tasks]()
    @State private var pathToGrocery = [GroceryList]()
    @State private var sortOrder = SortDescriptor(\Roomates.name)
    @State private var sortOrderTask = SortDescriptor(\Tasks.tasks)
    @State private var sortOrderGrocery = SortDescriptor(\GroceryList.item)
    
    var body: some View {
        NavigationStack(path: $path) {
            RoomateListingView(sort: sortOrder)
                .navigationTitle("Roomates")
                .navigationDestination(for: Roomates.self, destination: EditRoomateView.init)
                .toolbar {
                    Button("Grocery List", systemImage: "note.text.badge.plus", action: addGrocery)
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
            
//            NavigationLink(destination: GrocerylistView(sort: sortOrderGrocery)) {
//                Text("Grocery List")
//            }
//            .navigationDestination(for: GroceryList.self, destination: EditGroceryListView.init)
                
        }   // NS
    }
    
    func addRoomies() {
        let roomate = Roomates()
        modelContext.insert(roomate)
        path = [roomate]
    }
    
    func addGrocery() {
        let grocery = GroceryList()
        modelContext.insert(grocery)
        pathToGrocery = [grocery]
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
