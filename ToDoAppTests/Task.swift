//
//  Task.swift
//  ToDoApp
//
//  Created by Амиргали Туралинов on 21.11.2021.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    // не хотим устанавливать, но чтобы была
    private(set) var date: Date?
    let location: Location?
    
    init(title: String,
         description: String? = nil,
         location: Location? = nil) {
        self.title = title
        self.description = description
        self.date = Date()
        self.location = location
    }
}
