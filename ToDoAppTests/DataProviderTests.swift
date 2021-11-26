//
//  DataProviderTests.swift
//  ToDoAppTests
//
//  Created by Амиргали Туралинов on 23.11.2021.
//

import XCTest
@testable import ToDoApp

class DataProviderTests: XCTestCase {
    var sut: DataProvider!
    var tableView: UITableView!
    
    var controller: TaskListViewController!
    
    override func setUp() {
        sut = DataProvider()
        sut.taskManager = TaskManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as? TaskListViewController
        
        controller.loadViewIfNeeded()
        
        tableView = controller.tableView
        tableView.dataSource = sut
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Проверка, действительно ли в TableView 2 секции
    func testNumberOfSectionsIsTwo() {
        let numberOfSection = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSection, 2)
    }
    
    // Проверка, что количество задач, которые нужно выполнить равно кол-ву строк в первой секции
    func testNumberOfRowsInSectionZeroIsTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.taskManager?.add(task: Task(title: "Bar"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    // Проверка, что количество задач, которые уже выполнены равно кол-ву строк во второй секции
    func testNumberOfRowsInSectionOneIsDoneTasksCount() {
        sut.taskManager?.add(task: Task(title: "Foo"))
        sut.taskManager?.checkTask(at: 0)
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.taskManager?.add(task: Task(title: "Bar"))
        sut.taskManager?.checkTask(at: 0)
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
    }
    
    // Проверяем, какую ячейку получаем в cellForRowAt от indexPath
    //    func testCellForRowAtIndexPathReturnTasksCell() {
    //        sut.taskManager?.add(task: Task(title: "Foo"))
    //        tableView.reloadData()
    //
    //        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
    //
    //        XCTAssertTrue(cell is TaskCell)
    //    }
    
    // Подготовка к тесту была ниже в MockTableView
    // Наш метод переиспользует ячейку от TableView
    //    func testCellForRowAtIndexPathDequeuesCellFromTableView() {
    //        let mockTableView = MockTableView()
    //        mockTableView.dataSource = sut
    //        mockTableView.register(TaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
    //
    //        // Добавляем объект в mockTabbleView
    //        sut.taskManager?.add(task: Task(title: "Foo"))
    //        mockTableView.reloadData()
    //
    //        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
    //
    //        XCTAssertTrue(mockTableView.cellIsDequeued)
    //    }
    
    // Проверяем, срабатывает ли метод Конфигур в первой секции
    func testCellForRowInSectionZeroCallsConfigure() {
        tableView.register(MockTaskCell.self, forCellReuseIdentifier: String(describing: TaskCell.self))
        
        let task = Task(title: "Foo")
        sut.taskManager?.add(task: Task(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockTaskCell
        
        XCTAssertEqual(cell.task, task)
    }
}


// Добавим двойника TableView и добавим свойство, которое будет говорить переиспользовали мы ячейку или нет
extension DataProviderTests {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        // Проверим, переиспользуется ли ячейка
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockTaskCell: TaskCell {
        var task: Task?
        
       override func configure(withTask task: Task) {
            self.task = task
        }
    }
}
