//
//  MockNetworkService.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-08.
//

import Foundation

class MockNetworkService: WebserviceProtocol {
    
    func getAllQuizes(url: URL, completion: @escaping (Result<[QuizDTO], NetworkError>) -> Void) {
        let quizesDTO = QuizData.loadQuizDTOs()
        completion(.success(quizesDTO))
    }
    
    func getQuizById(url: URL, completion: @escaping (Result<QuizDTO, NetworkError>) -> Void) {
        let quizesDTO = QuizData.loadQuizDTOs()
        let quizDTO = quizesDTO.first { $0.quizId == 1 }!
        
        completion(.success(quizDTO))
    }
    
}
