//
//  QuestionModel.swift
//  Curiosity
//
//  Created by Ugonna O on 3/30/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class QuestionModel {
    private static let db = Firestore.firestore()
    private static let QUESTIONS_COLLECTION = "Questions"
    private static let QUESTIONS_DOCUMENT = "QuestionDoc"
    private static let QUESTION_DOCUMENT_QUESTION_LIST = "QuestionList"
    private static let QUESTION_DOCUMENT_DATA = "Question"



    
    
    static func addQuestion(question: String) async {
        do {
            let ref = try await db.collection(QUESTIONS_COLLECTION).addDocument(
                data: [ QUESTION_DOCUMENT_DATA : question]
            )
          print("Document added with ID: \(ref.documentID)")
        } catch {
          print("Error adding document: \(error)")
        }
    }
    
    static func getAQuestion() async -> String {
        var question : String = ""
        do {
            var questions = try await db.collection(QUESTIONS_COLLECTION).getDocuments()
            // Grab a random question IDX
            var idx = Int.random(in: 0..<questions.count)
            var questionData = questions.documents[idx].data()
            question = questionData.removeValue(forKey: QUESTION_DOCUMENT_DATA) as! String

            print("Question Retrieved: \(question)")
        } catch {
          print("Error adding document: \(error)")
        }
        return question
    }
}

