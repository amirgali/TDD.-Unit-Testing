//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Амиргали Туралинов on 21.11.2021.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    // Проверка на иницилизацию заголовка
    func testInitTaskWithTitle() {
        // Красная зона.
        let task = Task(title: "Foo")
        // Зеленая зона
        XCTAssertNotNil(task)
    }
    
    // Можем ли создать Таск при передаче заголовка и описания
    func testInitTaskWithTitleAndDescription() {
        // Красная зона.
        let task = Task(title: "Foo", description: "Bar")
        // Зеленая зона
        XCTAssertNotNil(task)
    }
    
    // Проверка, если ли действительно заголовок и описание
    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        
        // Проверка, что можем установить заголовок и он равен Foo
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertTrue(task.description == "Bar")
    }
    
    // Проверка, есть ли дата у таска
    func testTaskInitWithDate() {
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task.date)
    }
}
