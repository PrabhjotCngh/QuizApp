//
//  QuestionViewModel.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import Foundation

struct QuestionListViewModel: Identifiable {
    
    var id: Int {
        question.questionId
    }
    
    private let question: QuestionDTO
    
    init(question: QuestionDTO) {
        self.question = question
    }
    
    var questionId: Int {
        question.questionId
    }
    
    var text: String {
        question.text
    }
    
    var point: Int {
        question.point
    }
    
    var choices: [ChoiceViewModel] {
        question.choices.map(ChoiceViewModel.init)
    }
}

struct ChoiceViewModel: Identifiable {
    
    var id: Int {
        choice.choiceId
    }
    
    private var isSelected: Bool = false
    private let choice: ChoiceDTO
    
    init(choice: ChoiceDTO) {
        self.choice = choice
    }
    
    var choiceId: Int {
        choice.choiceId
    }
    
    var text: String {
        choice.text
    }
    
    mutating func setSelected() {
        isSelected = true
    }
}



