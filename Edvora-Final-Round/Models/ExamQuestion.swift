//
//  ExamQuestion.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation

struct ExamQuestion: Identifiable {
    let id = UUID().uuidString

    var question: String = "Add question here"

    var options: [QuestionOption]


    struct QuestionOption: Identifiable {
        let id = UUID().uuidString

        var option: String = "Add option"

        var position: Int
        var selected: Bool

        static var example1 = QuestionOption(option: "91.507 million miles", position: 0, selected: false)
        static var example2 = QuestionOption(option: "50 million miles", position: 1, selected: false)
        static var example3 = QuestionOption(option: "10 million miles", position: 2, selected: false)
        static var example4 = QuestionOption(option: "32 million miles", position: 3, selected: false)
    }

    static var example = ExamQuestion(question: "How far is the sun from the earth", options: [QuestionOption.example1, QuestionOption.example2, QuestionOption.example3, QuestionOption.example4])


}
