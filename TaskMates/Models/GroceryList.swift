//
//  GroceryList.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/16/24.
//

import Foundation
import SwiftData

@Model
class GroceryList {
    var item: String
    var isTaken: Bool
    
    init(item: String = "", isTaken: Bool = false) {
        self.item = item
        self.isTaken = isTaken
    }
}
