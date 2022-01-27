//
//  QuestionOption.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/26/22.
//

import Foundation


struct QuestionOption: Identifiable, Equatable, Hashable {
    let id  = UUID().uuidString

    var title: String = ""

    var position: Int = 0
    var isAnswer: Bool = false
    var correct: Bool = false
    var toBeDeleted: Bool = false

    

    static var example1 = QuestionOption(title: "91.507 million miles", position: 0, isAnswer: false)
    static var example2 = QuestionOption(title: "50 million miles", position: 1, isAnswer: false)
    static var example3 = QuestionOption(title: "10 million miles", position: 2, isAnswer: false)
    static var example4 = QuestionOption(title: "32 million miles", position: 3, isAnswer: false)



}
