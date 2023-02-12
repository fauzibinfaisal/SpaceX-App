//
//  rocketappUITests.swift
//  rocketappUITests
//
//  Created by Gop-c2s2-f on 10/02/23.
//

import XCTest
//@testable import rocketapp

class rocketappUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
//    var app: XCUIApplication!
//
//    override func setUp() {
//        super.setUp()
//        app = XCUIApplication()
//        app.launch()
//    }
//
//    func testRocketList() {
//        app = XCUIApplication()
//                app.launch()
//        let rocketListTable = app.tables.element(boundBy: 0)
//        XCTAssertTrue(rocketListTable.exists, "Rocket List table not exists")
//
//        let cells = rocketListTable.cells
//        XCTAssertTrue(cells.count > 0, "There is no rocket available")
//
//        cells.element(boundBy: 0).tap()
//
//        let rocketDetailView = app.otherElements["RocketDetailView"]
//        XCTAssertTrue(rocketDetailView.exists, "Rocket Detail view not exists")
//
//        let backButton = app.navigationBars.buttons.element(boundBy: 0)
//        XCTAssertTrue(backButton.exists, "Back button not exists")
//        backButton.tap()
//
//        XCTAssertTrue(rocketListTable.exists, "Rocket List table not exists after back from detail")
//    }
}
