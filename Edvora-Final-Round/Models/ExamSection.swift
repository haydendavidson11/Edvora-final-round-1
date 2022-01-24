//
//  ExamSection.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation

struct ExamSection: Identifiable {
    let id = UUID().uuidString

    var title: String
    var description: String

    static var example = ExamSection(title: "New Section", description: "Example Description Here")
}
