//
//  Exams.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct Exams: View {
    var body: some View {
        NavigationView {
            CreateNewExam()
        }
    }
}

struct Exams_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Exams()
        }
    }
}
