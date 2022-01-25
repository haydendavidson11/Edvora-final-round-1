//
//  ExamQuestionView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct ExamQuestionView: View {
    @State private var questionTitle = ""
    @State private var questions = [ExamQuestion]()
    @State private var selected = false
    @State private var optionTitle = ""

    

    var body: some View {
        VStack {
            TextField("", text: $questionTitle)
                .placeholder(when: questionTitle.isEmpty) {
                    Text("Add question here").foregroundColor(.lightPink)
                }
            Divider()

            ForEach(0..<5) { i in

                    QuestionOption()

            }

            HStack {
                Button {
                    // Discard option
                } label: {
                    Text("Discard")
                        .font(.headline)
                        .foregroundColor(.lightPink)
                }

                Spacer()

                Button {
                    // Save
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.buttonGreen)
                }

            }
            .padding()

        }
        .padding()
//        .frame(width: 300, height: 300)
        .background(RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))

    }
}

struct ExamQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ExamQuestionView()
    }
}


