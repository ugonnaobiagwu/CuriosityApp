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
                LandingText()
                SendQuestion()
                    .padding(.top, 50)
                
                Spacer()
                BackHomeButton()
                Spacer()
            }
            .padding()
    }
}

struct SendQuestion: View {
    @State private var userQuestion: String = ""
    var body: some View {
        VStack {
            TextField("Enter Question", text: $userQuestion)
                .padding([.bottom, .trailing], 20)
            
            Button("Send Question") {
                Task { await QuestionModel.addQuestion(question: userQuestion)}
            }
                .buttonStyle(.bordered)
                .tint(QuestionViewModel.isSendQuestionTextEmpty(text: userQuestion))
                .buttonBorderShape(.roundedRectangle(radius: 20.0))
                .disabled(userQuestion.isEmpty)
                .font(.headline)
        }
    }
}

struct BackHomeButton: View {
    var body: some View {
        VStack {
            
            Button("Return to Question Deck") {
               
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

struct LandingText: View {
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
