//
//  ContentView.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import SwiftUI

struct QuizListView: View {
    //MARK: - Properties
    @StateObject private var quizListVM = QuizListViewModel(webserviceProtocol: NetworkServiceFactory.create())
    @State private var selectedQuiz: QuizViewModel?
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(quizListVM.quizes) { quiz in
                NavigationLink() {
                    QuestionListView(quiz: quiz, quizSubmission: QuizSubmission(quizId: quiz.quizId))
                } label: {
                    Text(quiz.title)
                }
            }//: List
            .accessibilityIdentifier("quizList")
            .onAppear {
                quizListVM.populateAllQuizes()
            }
            .navigationTitle("Quizes")
            .navigationBarTitleDisplayMode(.inline)
        }//: NavigationView
        .environment(\.rootPresentationMode, $selectedQuiz)
    }
}

//MARK: - Preview
struct QuizListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
    }
}
