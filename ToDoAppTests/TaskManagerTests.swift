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
    
    // Проверка, что после выполнения задачи меняются кол-во задач которые нужно выполнить (tasksCount) и уже выполненно (doneTasksCount)
    func testCheckTaskAtIndexChangesCounts() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.tasksCount, 0)
        XCTAssertEqual(sut.doneTasksCount, 1)
    }
    
    // Проверка, когда отмечаем как done таск - он действительно удаляется из массива tasks
    func testCheckedTaskRemovedFromTasks() {
        let firstTask = Task(title: "Foo")
        let secondTask = Task(title: "Bar")
        sut.add(task: firstTask)
        sut.add(task: secondTask)
        
        sut.checkTask(at: 0)
        
        XCTAssertEqual(sut.task(at: 0), secondTask)
    }
    
    // Задача, которая выполненна попадает в массив с выполненными задачами
    func testDoneTaskAtReturnCheckedTask() {
        let task = Task(title: "Foo")
        sut.add(task: task)
        
        sut.checkTask(at: 0)
        let returnedTask = sut.doneTask(at: 0)
        
        XCTAssertEqual(returnedTask, task)
    }
    
    // Метод, который удалит все объекты из 2-х массивов
    func testRemoveAllResultsCountsBeZero() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Bar"))
        // Передаем 1 элеменет во 2-ой массив
        sut.checkTask(at: 0)
        
        sut.removeAll()
        
        XCTAssertTrue(sut.tasksCount == 0)
        XCTAssertTrue(sut.doneTasksCount == 0)
    }
    
    // Проверка на уникальные значения. Сначала добавим 2 таска и убедимся, что элемент не добавился дважды
    func testAddingSameObjectDoesNotIncrementCount() {
        sut.add(task: Task(title: "Foo"))
        sut.add(task: Task(title: "Foo"))

        XCTAssertTrue(sut.tasksCount == 1)
    }
}
