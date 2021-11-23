//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Амиргали Туралинов on 23.11.2021.
//

import XCTest
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Проверка, дествительно ли после загрузки ViewController он имеет внутри себя table view
    func testTableViewNotNillWhenViewLoaded() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self))
        let sut = vc as! TaskListViewController
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.tableView)
    }
}
