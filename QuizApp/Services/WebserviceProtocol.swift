//
//  WebserviceProtocol.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import Foundation

protocol WebserviceProtocol {
    func getAllQuizes(url: URL, completion: @escaping (Result<[QuizDTO], NetworkError>) -> Void)
    func getQuizById(url: URL, completion: @escaping (Result<QuizDTO, NetworkError>) -> Void)
}
