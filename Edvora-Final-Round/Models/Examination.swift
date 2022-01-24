//
//  Examination.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation


struct Examination: Identifiable {
    let id = UUID().uuidString

    var classroom: Classroom
    var syllabus: String
    var date: Date
    var time: Date
    var duration: Date
    var timeFrame: Date
    var totalMarks: Int
    var category: [String]

    var complete: Bool

    var instructions: String

    var section: [ExamSection]

    static var example = Examination(classroom: Classroom.example, syllabus: "New Syllabus", date: Date(), time: Date(), duration: Date(), timeFrame: Date(), totalMarks: 20, category: ["internal, mock, ect"], complete: false, instructions: "These the intructions.", section: [ExamSection.example])


    var inProgress: Bool {
        //  Check if the date and time are after the CurrentDate

        return true
    }

}
