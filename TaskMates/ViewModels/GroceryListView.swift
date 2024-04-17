//
//  GroceryList.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/15/24.
//

import SwiftUI
import SwiftData


struct GrocerylistView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\GroceryList.item)]) var grocery: [GroceryList]
//    @State private var groceryItems: [String] = []
    @State private var newItem: String = ""
    @State private var showingAddItemAlert = false

    var body: some View {
        NavigationView {
            List {
                ForEach(grocery) { grocery in
                    HStack {
                        Text(grocery.item)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                    
                }
                .onDelete(perform: deleteItems)
            }
            
        }
        .alert("Add Item", isPresented: $showingAddItemAlert, actions: {
            TextField("Enter item name", text: $newItem)
            Button("Add", role: .destructive) {
                addItem()
            }
        }, message: {
            Text("Please enter your grocery item")
        })
    }

    func addItem() {
        guard newItem.isEmpty == false else { return }

        withAnimation {
            let grocery = GroceryList(item: newItem, isTaken: false)
            modelContext.insert(grocery)
            newItem = ""
        }
    }

    func deleteItems(_ indexSet: IndexSet) {
        for index in indexSet {
            let grocery = grocery[index]
            modelContext.delete(grocery)
        }
    }
    
    init(sort: SortDescriptor<GroceryList>) {
        _grocery = Query(sort: [sort])
    }
}

struct ChecklistView_Previews: PreviewProvider {
    static var previews: some View {
        GrocerylistView(sort: SortDescriptor(\GroceryList.item))
    }
}
