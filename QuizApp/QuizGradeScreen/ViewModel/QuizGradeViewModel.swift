//
//  QuizGradeViewModel.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import Foundation

class QuizGradeViewModel: ObservableObject {
    @Published var grade: GradeViewModel?
    var webserviceProtocol: WebserviceProtocol
    
    init(webserviceProtocol: WebserviceProtocol) {
        self.webserviceProtocol = webserviceProtocol
    }
    
    func submitQuiz(submission: QuizSubmission) {
        webserviceProtocol.getQuizById(url: Constants.Urls.quizById(submission.quizId)) { result in
            switch result {
                case .success(let quizDTO):
                    let quiz = Quiz(quizDTO: quizDTO)
                    let grade = quiz.grade(submission: submission)
                    DispatchQueue.main.async {
                        self.grade = GradeViewModel(grade: grade)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}

struct GradeViewModel {
    
    private let grade: Grade
    
    init(grade: Grade) {
        self.grade = grade
    }
    
    var letter: String {
        grade.letter.uppercased()
    }
    
    var score: Int {
        grade.score
    }
    
}
