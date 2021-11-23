//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Амиргали Туралинов on 23.11.2021.
//

import XCTest
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {
    var sut: TaskListViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self))
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Проверка, дествительно ли после загрузки ViewController он имеет внутри себя table view
    func testWhenViewLoadedTableViewNotNill() {
        XCTAssertNotNil(sut.tableView)
    }
    
    // Проверка объекта data provider после загрузки TaskList
    func testWhenViewIsLoadDataProviderIsNotNill() {
        XCTAssertNotNil(sut.dataProvider)
    }
    
    // Проверка, что после загрузки контроллера делегат будет установлен
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }
    
    // Проверка, что после загрузки контроллера data source будет установлен
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    // Проверка, что делегатом и data source является наш DataProvider
    func testWhenViewIsLoadedTabViewDelegateEqualsTableViewDataSource() {
        XCTAssertEqual(sut.tableView.delegate as? DataProvider, sut.tableView.dataSource as? DataProvider)
    }
}
