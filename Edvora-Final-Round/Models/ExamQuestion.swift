//
//  ExamQuestion.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation

struct ExamQuestion: Identifiable {
    let id = UUID().uuidString

    var title: String = ""

    var options = [QuestionOption]()


    

    static var example = ExamQuestion(title: "How far is the sun from the earth", options: [QuestionOption.example1, QuestionOption.example2, QuestionOption.example3, QuestionOption.example4])


}
