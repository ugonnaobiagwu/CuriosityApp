//
//  QuestionViewModel.swift
//  Curiosity
//
//  Created by Ugonna O on 3/31/24.
//

import Foundation
import SwiftUI

class QuestionViewModel {
    static func isSendQuestionTextEmpty(text: String) -> Color {
        if (text.isEmpty) {
            return Color.gray
        } else {
            return Color.purple
        }
    }
    
}
