//
//  ExamQuestionView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct ExamQuestionView: View {
    @State private var questionTitle = ""
    @State private var options = [ExamQuestion]()
    @State private var selected = false
    @State private var optionTitle = ""
    @State private var editing = true

    var optionCount: Int

    @Binding var question : ExamQuestion

    @State private var optionsToBeRemoved: Set<QuestionOption> = []


    var body: some View {
        VStack {
            TextField("", text: $question.title)
                .placeholder(when: question.title.isEmpty) {
                    Text("Add question here").foregroundColor(.lightPink)
                }

            Divider()

            if $question.options.isEmpty {
                HStack {
                    Spacer(minLength: 37.5)
                NewOptionView(questionCount: question.options.count, saveOption: saveOption)
                    Spacer(minLength: 37.5)
                }
            } else {
                
                ForEach($question.options) { $option in
                    QuestionOptionView(editing: editing, option: option, optionsToBeRemoved: $optionsToBeRemoved, saveOption: saveOption)
                }
                if question.options.count <= 25 && editing {
                    HStack {
                        Spacer(minLength: 37.5)
                    NewOptionView(questionCount: question.options.count, saveOption: saveOption)
                        Spacer(minLength: 37.5)
                    }
                }

            }

            HStack {
                if editing {
                    Button {
                        // Discard option

                        deleteOptions()
                    } label: {
                        Text("Discard")
                            .font(.headline)
                            .foregroundColor(optionsToBeRemoved.isEmpty ? .lightPink : .darkPink)
                    }


                    Spacer()

                    Button {
                        // Save

                        self.editing = false
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .foregroundColor(.buttonGreen)
                    }

                } else {
                    Button(role: .destructive) {
                        // Remove question



                    } label: {
                        Text("Remove")
                            .font(.headline)
                    }

                    Spacer()

                    Button {
                        // Save
                        self.editing = true
                    } label: {
                        Text("Edit")
                            .font(.headline)
                            .foregroundColor(.darkBlue)
                    }


                }

            }
            .padding()

        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))

    }


    func saveOption(_ option: QuestionOption) {
        if !question.options.contains(where: {
            option.id == $0.id
        }) {
            question.options.append(option)
        }
    }


    func deleteOptions() {
        for option in optionsToBeRemoved {
            if let pos = question.options.firstIndex(of: option) {
                question.options.remove(at: pos)
            }
        }
        optionsToBeRemoved.removeAll()
    }
}

struct ExamQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ExamQuestionView(optionCount: 1, question: .constant(ExamQuestion.example))
    }
}


