//
//  ExaminationsView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct ExaminationsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Examinations")
                    .foregroundColor(.darkGray)
                    .fontWeight(.bold)
                Spacer()

                NavigationLink(destination: Text("Create New Exam View")) {
                    Image(systemName: "plus")
                        .foregroundColor(.lightPink)
                }

            }

            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<5) { i in
                        ExamCardView(exam: Examination.example)
                    }
                }
            }
            .frame(maxHeight: 180)
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
    }
}

struct ExaminationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExaminationsView()
    }
}
