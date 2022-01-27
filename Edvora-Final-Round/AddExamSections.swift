//
//  AddExamSections.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct AddExamSections: View {
    @Binding var section: ExamSection

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var state: AppState

    let notificationCenter = NotificationCenter.default

    @State private var instructions = ""
    @State private var sectionTitle = ""
    @State private var SectionDescription = ""

    var saveExam: () -> Void



    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()

            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Add Instructions")
                        .foregroundColor(.darkGray)
                        .fontWeight(.medium)

                    TextField("", text: $section.instructions)
                        .padding(.horizontal)
                        .frame(minHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))

                    Text("Section Name")
                        .foregroundColor(.darkGray)
                        .fontWeight(.medium)

                    TextField("", text: $section.title)
                        .padding(.horizontal)
                        .placeholder(when: section.title.isEmpty, placeholder: {
                            Text("Section title").foregroundColor(.lightGray).opacity(0.7)
                                .padding(.horizontal)
                        })
                        .frame(minHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))

                    ShadedTextEditor(text: $section.description)
                        .frame(maxHeight: 120)

                    if !section.sectionQuestions.isEmpty {
                        ForEach($section.sectionQuestions) { $question in
                            ExamQuestionView(optionCount: question.options.count, question: $question)
                        }
                    }



                    Button {
                        // Add Question
                        section.sectionQuestions.append(ExamQuestion())
                        print(section.sectionQuestions.count)

                    } label: {
                        HStack {
                            Spacer()
                            if section.sectionQuestions.isEmpty {
                                Text("Add question")
                                    .font(.headline)
                                    .padding()
                            } else {
                                Text("Add another question")
                                    .font(.headline)
                                    .padding()
                            }
                            Spacer()
                        }
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.darkPink).opacity(0.15))
                    }
                    .padding([.top, .leading, .trailing])

                    Button {
                        // Add Another Section

                        
                    } label: {
                        HStack {
                            Spacer()
                            Text("Add another section")
                                .font(.headline)
                                .padding()
                            Spacer()
                        }
                        .background(RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(.darkPink).opacity(0.15))
                    }
                    .padding()

                }
                .padding()
                .background(Color(uiColor: .systemBackground))





            }
        }
        .toolbar {

            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                    print("back button pressed")
                } label: {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.lightPink)
                }

            }

            ToolbarItem(placement: .navigationBarLeading) {
                Text("Create New exam")
                    .foregroundColor(.darkGray)
                    .fontWeight(.medium)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // save
                    saveExam()
                } label: {
                    Text("Save")
                        .font(.system(size: 20))
                        .foregroundColor(.lightPink)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.lightPink))
                }

            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct AddExamSections_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddExamSections(section: .constant(ExamSection.example), saveExam: {})
        }
    }
}
