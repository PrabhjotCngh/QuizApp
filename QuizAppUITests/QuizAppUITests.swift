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
        if (app.collectionViews["quizList"].exists) {
            let quizList = app.collectionViews["quizList"]
            XCTAssertEqual(2, quizList.cells.count)
        }
    }
}

class when_user_taps_on_a_quiz: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_display_questions_for_the_selected_quiz() {
        let quizList = app.collectionViews["quizList"]
        quizList.buttons["Math 101"].tap()
        
        //let _ = app.tables["quizList"].waitForExistence(timeout: 2.0)
        XCTAssertEqual(3, app.collectionViews["questionList"].cells.count)
    }
}

class when_user_submit_quiz_without_answering_all_questions: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_display_error_message_on_the_screen() {
        let quizList = app.collectionViews["quizList"]
        quizList.buttons["Math 101"].tap()
        
        let _ = app.buttons["submitQuizButton"].waitForExistence(timeout: 2.0)
        app.buttons["submitQuizButton"].tap()
        
        XCTAssertEqual(Constants.Messages.quizSubmissonFailed, app.staticTexts["messageText"].label)
    }
}

class when_user_submits_quiz: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchEnvironment = ["ENV": "TEST"]
        continueAfterFailure = false
        app.launch()
    }
    
    func test_should_navigate_to_the_grade_screen_and_display_their_grade() {
        let quizList = app.collectionViews["quizList"]
        quizList.buttons["Math 101"].tap()
        
        let _ = app.collectionViews["questionList"].waitForExistence(timeout: 5.0)
        let questionListTable = app.collectionViews["questionList"]
                
        questionListTable.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "Square").element(boundBy: 1).tap()
        questionListTable.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "Square").element(boundBy: 2).tap()
        questionListTable.children(matching: .cell).element(boundBy: 2).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .image).matching(identifier: "Square").element(boundBy: 3).tap()
        
        app.buttons["submitQuizButton"].tap()
        XCTAssertTrue(app.staticTexts["A"].waitForExistence(timeout: 2.0))
    }
}
