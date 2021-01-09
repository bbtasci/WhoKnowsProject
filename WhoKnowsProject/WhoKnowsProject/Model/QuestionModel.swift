//
//  QuestionModel.swift
//  WhoKnowsProject
//
//  Created by Baris Berkin Tasci on 9.01.2021.
//

import Foundation

struct QuestionModel: Codable {
    var results: [QuestionData] = []
}

struct QuestionData: Codable {
    var category: String
    var type: String
    var difficulty: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}
