//
//  Examination.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation


struct Examination: Identifiable {
    let id = UUID().uuidString

    var classroom = Classroom()
    var syllabus = ""
    var date = "" // should really be a Date
    var time = "" // should really be a Date
    var duration = "" // should really be a Date
    var timeFrame = "" // should really be a Date
    var totalMarks = ""
    var category = [String]()

    var complete = false

    var instructions = ""

    var sections = [ExamSection()]

    

    static var example1 = Examination(classroom: Classes().allClasses.randomElement() ?? Classroom.example, syllabus: "New Syllabus", date: "", time: "", duration: "", timeFrame: "", totalMarks: "20", category: ["internal, mock, ect"], complete: false, instructions: "These the intructions.", sections: [ExamSection.example])

//    var inProgress = Bool.random()


}
