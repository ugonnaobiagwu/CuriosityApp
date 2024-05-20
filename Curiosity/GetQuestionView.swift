//
//  GetQuestion.swift
//  Curiosity
//
//  Created by Ugonna O on 5/20/24.
//

import SwiftUI

struct GetQuestionView: View {
    var body: some View {
        Spacer()
        GetQuestion()
        Spacer()

    }
}

struct GetQuestion: View {
    @State private var userQuestion: String = "Press the button to get a question"
    var body: some View {
        VStack {
            Spacer()
            GetQuestionLandingText()
            Spacer()
                .frame(height: 20)
            Text(userQuestion)
                .font(.subheadline)
            Spacer()
            Button("Get Question") {
                Task { await userQuestion = QuestionModel.getAQuestion()}
            }
                .buttonStyle(.bordered)
                .tint(QuestionViewModel.isSendQuestionTextEmpty(text: userQuestion))
                .buttonBorderShape(.roundedRectangle(radius: 20.0))
                .font(.headline)
            Spacer()
            
        }
    }
}

struct GetQuestionLandingText: View {
    var body: some View {
        VStack {
            Text("Get A Question")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}


#Preview {
    GetQuestionView()
}
