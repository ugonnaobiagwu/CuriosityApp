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
    private static var previousQuestions : [String] = []



    
    
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
    
    // Returns an empty string if all questions have been cycled through
    static func getAQuestion() async -> String {
        var question : String = ""
        var questionGrabbed : Bool = false
        do {
            var questions : QuerySnapshot? = try await db.collection(QUESTIONS_COLLECTION).getDocuments()
            // Grab a random question IDX
            while (questionGrabbed == false) {
                let idx = Int.random(in: 0..<questions!.count)
                var questionData = questions!.documents[idx].data()
                var questionString = questionData.removeValue(forKey: QUESTION_DOCUMENT_DATA) as! String
                if (!previousQuestions.contains(questionString) && !questionString.elementsEqual("")) {
                    question = questionString
                    previousQuestions.append(question)
                    questionGrabbed = true
                    print("Question Retrieved: \(question)")
                }
            }
        } catch {
          print("Error getting document: \(error)")
        }
        return question
    }
}

