//
//  Classroom.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation

struct Classroom: Identifiable, Hashable {
    let id = UUID().uuidString

    var title: String
    var attendees: [String]
    var missed: [String]

    static var example = Classroom(title: "Object Oriented Programming in Java", attendees: [User.example.name], missed: [])

}
