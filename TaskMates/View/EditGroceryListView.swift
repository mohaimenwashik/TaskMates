//
//  GroceryListView.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/15/24.
//

import SwiftUI
import SwiftData

struct EditGroceryListView: View {
    @Bindable var groceries: GroceryList
    @State private var newItem = ""
    
    var body: some View {
        Form {
            HStack {
                Text("Name: ")
                TextField("Name", text: $groceries.item)
                Toggle(isOn: $groceries.isTaken) {
                    Text("")
                }
            }
            
        }   //form
        .navigationTitle("Item")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
        }
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: GroceryList.self, configurations: config)
        let example = GroceryList(item: "Example Item", isTaken: false)
//        let example2 = Roomates(name: "Example Name", phone: "1234567890")
        return EditGroceryListView(groceries: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
