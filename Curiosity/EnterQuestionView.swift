//
//  ContentView.swift
//  Curiosity
//
//  Created by Ugonna O on 3/30/24.
//

import SwiftUI

struct EnterQuestionView: View {
    var body: some View {
            VStack {
                Spacer()
                QuestionMark()
                EnterQuestionLandingText()
                SendQuestion()
                    .padding(.top, 50)
                
                Spacer()
//                BackHomeButton()
                Spacer()
            }
            .padding()
    }
}

struct SendQuestion: View {
    @State private var userQuestion: String = ""
    @State private var showAlert: Bool = false
    var body: some View {
        VStack {
            TextField("Enter Question", text: $userQuestion)
                .padding([.bottom, .trailing], 20)
            
            Button("Send Question") {
                Task { await QuestionModel.addQuestion(question: userQuestion)}
//                userQuestion = ""
                showAlert = true
                //Clear it so the user knows the question has been sent
            }
                .buttonStyle(.bordered)
                .tint(QuestionViewModel.isSendQuestionTextEmpty(text: userQuestion))
                .buttonBorderShape(.roundedRectangle(radius: 20.0))
                .disabled(userQuestion.isEmpty)
                .font(.headline)
                .alert("Question Sent!", isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        }
            
        }
    }
}

struct BackHomeButton: View {
    var body: some View {
        VStack {
            
            Button("Return Home") {
               
            }
                .buttonStyle(.bordered)
                .tint(.yellow)
                .buttonBorderShape(.roundedRectangle(radius: 20.0))
                .font(.headline)
        }
    }
}

struct QuestionMark: View {
    var body: some View {
        HStack {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 35)) // Change font size to 50
                .fontWeight(.semibold)
                .padding([.bottom, .trailing], 2)
            Image(systemName: "questionmark.circle")
                .font(.system(size: 50)) // Change font size to 50
                .fontWeight(.regular)
                .padding([.bottom, .trailing], 2)
            Image(systemName: "questionmark.circle")
                .font(.system(size: 35)) // Change font size to 50
                .fontWeight(.semibold)
                .padding([.bottom, .trailing], 2)
        }
    }
}

struct EnterQuestionLandingText: View {
    var body: some View {
        VStack {
            Text("Enter Your Question")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    EnterQuestionView()
}
