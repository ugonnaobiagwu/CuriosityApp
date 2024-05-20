//
//  HomeView.swift
//  Curiosity
//
//  Created by Ugonna O on 5/20/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
//        HomeLandingText()
        HomeButtons()
    }
}

struct HomeLandingText: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Send or Get \n a Question")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                
                
        }
    }
}

struct HomeButtons: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HomeLandingText()
                HStack {
                    SendQuestionButton()
                    RetrieveQuestionButton()
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct SendQuestionButton: View {
    var body: some View {
        NavigationLink {
            EnterQuestionView()
        } label: {
            VStack {
                Text("Send Question")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue.opacity(0.2)) // Semi-transparent fill
                        //                                    .stroke(Color.black, lineWidth: 2)
                            .tint(Color.blue)
                    )
                    .foregroundColor(.blue)
                    .font(.headline)
            }
            .padding()
        }
    }
}

struct RetrieveQuestionButton: View {
    var body: some View {
        NavigationLink {
            GetQuestionView()
        } label: {
            VStack {
                Text("Get Questions")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.purple.opacity(0.2)) // Semi-transparent fill
                        //                                    .stroke(Color.black, lineWidth: 2)
                            .tint(Color.purple)
                    )
                    .foregroundColor(.purple)
                    .font(.headline)
            }
            .padding()
        }
    }
}


#Preview {
    HomeView()
}
