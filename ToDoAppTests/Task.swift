//
//  Task.swift
//  ToDoApp
//
//  Created by Амиргали Туралинов on 21.11.2021.
//

import Foundation

struct Task {
    var title: String
    var description: String?
    // не хотим устанавливать, но чтобы была
    private(set) var date: Date?
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
    }
}
