//
//  QuizListViewModel.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import Foundation

class QuizListViewModel: ObservableObject {
    
    @Published var quizes: [QuizViewModel] = []
    var webserviceProtocol: WebserviceProtocol
    
    init(webserviceProtocol: WebserviceProtocol) {
        self.webserviceProtocol = webserviceProtocol
    }
    
    func populateAllQuizes() {
        webserviceProtocol.getAllQuizes(url: Constants.Urls.allQuizes) { result in
            switch result {
            case .success(let quizesDTO):
                DispatchQueue.main.async {
                    self.quizes = quizesDTO.map(QuizViewModel.init)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct QuizViewModel: Identifiable, Hashable {
    
    static func == (lhs: QuizViewModel, rhs: QuizViewModel) -> Bool {
        return lhs.quizId == rhs.quizId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(quizId)
    }
    
    let id = UUID()
    
    private let quiz: QuizDTO
    
    init(quiz: QuizDTO) {
        self.quiz = quiz
    }
    
    var quizId: Int {
        quiz.quizId
    }
    
    var title: String {
        quiz.title
    }
    
    var questions: [QuestionListViewModel] {
        quiz.questions.map(QuestionListViewModel.init)
    }
}
