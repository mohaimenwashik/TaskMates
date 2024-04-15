////
////  RoomateList.swift
////  TaskMates
////
////  Created by Mohaimen Washik on 4/15/24.
////
//
//import SwiftUI
//import SwiftData
//
//
//struct RoomateList: View {
//    @Environment(\.modelContext) var modelContext
//    @Query(sort: [SortDescriptor(\Roomates.name, order: .reverse)]) var roomates: [Roomates]
////    @State private var sortOrder = SortDescriptor(\Roomates.name)
//    
//    var body: some View {
//        List {
//            ForEach(roomates) { roomate in
//                NavigationLink(value: roomate) {
//                    VStack(alignment: .leading) {
//                        Text(roomate.name)
//                            .font(.headline)
//                    }
//                }
//            }
//            .onDelete(perform: removeRoomate)
//        }   // List
//    }
//    
//    init(sort: SortDescriptor<Roomates>) {
//        _roomates = Query(sort: [sort])
//    }
//    
//    func removeRoomate(_ indexSet: IndexSet) {
//        for index in indexSet {
//            let roomate = roomates[index]
//            modelContext.delete(roomate)
//        }
//    }
//}
//
//
//
//#Preview {
//    RoomateList(sort: SortDescriptor(\Roomates.name))
//}
