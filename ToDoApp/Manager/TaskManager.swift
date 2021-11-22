//
//  TaskManager.swift
//  ToDoApp
//
//  Created by Амиргали Туралинов on 22.11.2021.
//

import Foundation

class TaskManager {
    var tasksCount = 0
    let doneTasksCount = 0
    
    func add(task: Task) {
        tasksCount += 1
    }
    
    func task(at index: Int) -> Task {
        return Task(title: "")
    }
}
