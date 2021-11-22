//
//  TaskManagerTests.swift
//  ToDoAppTests
//
//  Created by Амиргали Туралинов on 22.11.2021.
//

import XCTest
@testable import ToDoApp

class TaskManagerTests: XCTestCase {
    var sut: TaskManager!

    override func setUpWithError() throws {
        sut = TaskManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // Проверим, что создавая такс менеджер у него не будет "выполненных" и "не выполненных" задач
    // Начем с задач, которые должны выполнить (не выполненные)
    func testInitTaskManagerWithZeroTasks() {
        // Проверим количество тасков
        XCTAssertEqual(sut.tasksCount, 0)
    }
    
    // Проверка выполненных задач
    func testInitTaskManagerWithZeroDoneTasks() {
        // Проверим количество тасков
        XCTAssertEqual(sut.doneTasksCount, 0)
    }
    
    // Проверка, что при добавлении задачи tasksCount увеличится на 1
    func testAddTaskIncrementTasksCount() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        XCTAssertEqual(sut.tasksCount, 1)
    }
    
    // Проверка, что добавленный такс есть тот же самый такс по конкретному индексу
    func testTaskAtIndexIsAddedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        let returnedTask = sut.task(at: 0)
        
        XCTAssertEqual(task.title, returnedTask.title)
    }
}
