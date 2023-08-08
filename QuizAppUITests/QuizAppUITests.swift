//
//  QuizAppUITests.swift
//  QuizAppUITests
//
//  Created by M_2195552 on 2023-08-07.
//

import XCTest

class when_app_is_launched: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_display_available_quizzes() {
        //let _ = app.tables["quizList"].waitForExistence(timeout: 5.0)
        
        if (app.tables["quizList"].exists) {
            let quizList = app.tables["quizList"]
            XCTAssertEqual(2, quizList.cells.count)
        }
    }
}


