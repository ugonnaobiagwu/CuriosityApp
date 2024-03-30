//
//  ContentView.swift
//  Curiosity
//
//  Created by Ugonna O on 3/30/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: { Task { await QuestionModel.addQuestion(question: "HRU")}})
            {
               Text("Send Question")
            }
                
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
