//
//  AppState.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import Foundation

class AppState: ObservableObject {
    @Published var selectedTab = "dashboard"
    @Published var exams = [Examination]()

    let user = User()

    let classes = Classes()

    var oop = Classroom(title: "Object Oriented Programming in Java", attendance: 0.80)
    var python = Classroom(title: "Python 101", attendance: 0.0)
    var swift = Classroom(title: "Swift 101", attendance: 0.99)
    var js = Classroom(title: "Javascript 101", attendance: 0.70)
    var react = Classroom(title: "React 101", attendance: 0.0)


    var setSelectedTab = "dashboard" {
        didSet {
            self.selectedTab = setSelectedTab
        }
    }



    init() {
        oop.attendees.append(user.id)
        python.missed.append(user.id)
        swift.attendees.append(user.id)
        js.attendees.append(user.id)
        react.missed.append(user.id)

        classes.allClasses = [oop, python, swift, js, react]

        for classroom in classes.allClasses {
            let newExam = Examination(classroom: classroom, syllabus: "", date: "", time: "", duration: "", timeFrame: "", totalMarks: "", category: ["Internal, mock, ect"], complete: false, instructions: "", sections: [])
            exams.append(newExam)
        }
    }


    func attendedClasses() -> Int {
        let attended = classes.allClasses.filter {$0.attendees.contains(user.id)}
        return attended.count
    }

    func missedClasses() -> Int {
        let missed = classes.allClasses.filter { $0.missed.contains(user.id)}
        return missed.count
    }

    func classesLeft() -> Int {
        return classes.allClasses.count - attendedClasses() - missedClasses()
    }

    func lowestAttendedClass(for user: User) -> Classroom? {
        let attended = classes.allClasses.filter {$0.attendees.contains(user.id)}
        var attendance = 1.0
        for classroom in attended {
            if classroom.attendance < attendance {
                attendance = classroom.attendance
            }
        }
        if let leastAttendedClass = attended.first(where: { $0.attendance == attendance}) {
            return leastAttendedClass
        }
        return nil
    }


}
