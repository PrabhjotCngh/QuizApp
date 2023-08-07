//
//  QuizAppTests.swift
//  QuizAppTests
//
//  Created by M_2195552 on 2023-08-07.
//

import XCTest
@testable import QuizApp

final class QuizAppTests: XCTestCase {

    func test_should_make_sure_quiz_total_points_are_calculated_correctly() {
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual(3, mathQuiz.questions.count)
        XCTAssertEqual(30, mathQuiz.totalPoints)
    }
}

class when_calculate_student_grade: XCTestCase {
    
    func test_calculate_grade_successfully_based_on_student_score() {
        let quizesDTOs = QuizData.loadQuizDTOs()
        let quizes = quizesDTOs.map(Quiz.init)
        
        let mathQuiz = quizes.first {
            $0.quizId == 1
        }!
        
        XCTAssertEqual("A", mathQuiz.calculateLetterGrade(score: 90))
        XCTAssertEqual("B", mathQuiz.calculateLetterGrade(score: 72))
        XCTAssertEqual("F", mathQuiz.calculateLetterGrade(score: 42))
    }
    
}
