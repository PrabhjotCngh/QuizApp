//
//  QuizGradeScreen.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import SwiftUI

struct QuizGradeScreen: View {
    //MARK: - Properties
    @StateObject private var quizGradeVM = QuizGradeViewModel(webserviceProtocol: NetworkServiceFactory.create())
    let submission: QuizSubmission
    let quiz: QuizViewModel
    @State private var startOver: Bool = false
    @Environment(\.rootPresentationMode) var rootPresentationMode
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            if let grade = quizGradeVM.grade {
                VStack(spacing: 50) {
                    Text("Final Grade")
                    Text(grade.letter)
                        .font(.system(size: 52))
                }
            } else {
                ProgressView("Calculating grade...")
            }
            Spacer()
            Button("Start over") {
                rootPresentationMode.wrappedValue.dismiss()
            }
            
        } //: VStack
        .navigationTitle(quiz.title)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            quizGradeVM.submitQuiz(submission: submission)
        }
    }
}

//MARK: - Preview
struct QuizGradeScreen_Previews: PreviewProvider {
    static var previews: some View {
        let submission = QuizSubmission(quizId: 1)
        let quiz = QuizData.loadQuizes()[0]
        NavigationView {
            QuizGradeScreen(submission: submission, quiz: quiz)
        }
    }
}
