//
//  QuizGradeViewModel.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import Foundation

class QuizGradeViewModel: ObservableObject {
    var webserviceProtocol: WebserviceProtocol
    
    init(webserviceProtocol: WebserviceProtocol) {
        self.webserviceProtocol = webserviceProtocol
    }
    
    func submitQuiz(submission: QuizSubmission) {
        webserviceProtocol.getQuizById(url: Constants.Urls.quizById(submission.quizId)) { result in
            switch result {
                case .success(let quizDTO):
                    print(quizDTO)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
