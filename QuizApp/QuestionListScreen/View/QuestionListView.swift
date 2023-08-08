//
//  QuestionListView.swift
//  QuizApp
//
//  Created by M_2195552 on 2023-08-07.
//

import SwiftUI

struct QuestionListView: View {
    //MARK: - Properties
    let quiz: QuizViewModel
    @State var quizSubmission: QuizSubmission
    @State private var gradeQuiz: Bool = false
    @State private var message: String = ""
    
    //MARK: - Functions
    func isSubmissionValid() -> Bool {
        return quizSubmission.selectedChoices.count == quiz.questions.count
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            List(quiz.questions.indices) { index in
                let question = quiz.questions[index]
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(index + 1)")
                            .padding(10)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .clipShape(Circle())
                        
                        Text(question.text)
                            .font(.system(size: 22))
                    } //: HStack
                    
                    ForEach(question.choices) { choice in
                        HStack {
                            Image(systemName: quizSubmission.isSelected(questionId: question.questionId, choiceId: choice.choiceId) ? "checkmark.square": "square")
                                .onTapGesture {
                                    quizSubmission.addChoice(questionId: question.questionId, choiceId: choice.choiceId)
                                }
                            Text(choice.text)
                        } //: HStack
                    } //: ForEach
                } //: VStack
                
            } //: List
            .accessibilityIdentifier("questionList")
            .listStyle(.plain)
            .buttonStyle(.plain)
            
            Text(message)
                .accessibility(identifier: "messageText")
            
            NavigationLink(isActive: $gradeQuiz) {
                QuizGradeScreen(submission: quizSubmission, quiz: quiz)
            } label: {
                Button("Submit") {
                    if isSubmissionValid() {
                        gradeQuiz = true
                    } else {
                        message = Constants.Messages.quizSubmissonFailed
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 44)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                .padding()
                .accessibility(identifier: "submitQuizButton")
            }
            Spacer()
            
        } //: VStack
        .onAppear(perform: {
            quizSubmission = QuizSubmission(quizId: quiz.quizId)
        })
    }
}

//MARK: - Preview
struct QuestionListView_Previews: PreviewProvider {
    static var previews: some View {
        let quiz = QuizData.loadQuizes()[0]
        NavigationView {
            QuestionListView(quiz: quiz, quizSubmission: QuizSubmission(quizId: quiz.quizId))
                .navigationTitle(quiz.title)
        }
    }
}
