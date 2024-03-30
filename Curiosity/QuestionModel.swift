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


    
    
    static func addQuestion(question: String) async {
        do {
            let ref = try await db.collection(QUESTIONS_COLLECTION).addDocument(
                data: ["Question" : question]
            )
          print("Document added with ID: \(ref.documentID)")
        } catch {
          print("Error adding document: \(error)")
        }
    }
}

