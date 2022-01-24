//
//  User.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import Foundation
import SwiftUI

class User: Identifiable {
    let id = UUID().uuidString

    var name: String = "Hayden"
    var image: Image = Image(systemName: "person.fill")
    

    var totalClasses = [Classroom]()
    var missedClasses = [Classroom]()
    var attendedClasses = [Classroom]()

    static var example = User()
}
