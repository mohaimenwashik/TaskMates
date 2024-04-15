//
//  Roomates.swift
//  TaskMates
//
//  Created by Mohaimen Washik on 4/14/24.
//

import Foundation
import SwiftData

@Model
class Roomates {
    var name: String
    var phone: String
    @Relationship(deleteRule: .cascade) var tasks = [Tasks]()
    
    init(name: String = "", phone: String = "") {
        self.name = name
        self.phone = phone
    }
}
