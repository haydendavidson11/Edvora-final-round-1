//
//  ExamCardView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct ExamCardView: View {
    var exam: Examination

    var body: some View {

        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(exam.classroom.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)

                Spacer()

                if exam.classroom.attendance > 0.0 {
                    Button {
                        // Take Exam
                    } label: {
                        Text("Take")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .buttonStyle(.bordered)
                    .background(Color.buttonGreen)
                    .cornerRadius(5)

                }
            }

            HStack {
                // Time Frame
                Text("3 pm - 6 pm")
                    .foregroundColor(.lightGray)
                Spacer()
                // Syllabus
                Text("MCQs")
                    .foregroundColor(.lightGray)
            }

            HStack {
                // marks
                Text("20 marks")
                    .foregroundColor(.lightGray)
                Spacer()

                // category
                Text("Internal One")
                    .foregroundColor(.darkPink)
            }


        }
        .padding()
        .background(Color(uiColor: .secondarySystemBackground)
                        .cornerRadius(10)
                        .frame(height: 180))
            .frame(width: 320, height: 180)

    }
}

struct ExamCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExamCardView(exam: Examination.example1)
    }
}
