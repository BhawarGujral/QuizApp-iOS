//
//  Question.swift
//  QuizApp
//
//  Created by Bhawar Gujral on 2024-07-05.
//

import Foundation

class Question{
    
    var question:String
    var correctOption:String
    var incorrectOption1:String
    var incorrectOption2:String
    var incorrectOption3:String
    
    init(question: String, correctOption: String, incorrectOption1: String, incorrectOption2: String, incorrectOption3: String) {
        self.question = question
        self.correctOption = correctOption
        self.incorrectOption1 = incorrectOption1
        self.incorrectOption2 = incorrectOption2
        self.incorrectOption3 = incorrectOption3
    }
    
    
}
