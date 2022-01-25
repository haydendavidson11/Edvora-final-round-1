//
//  AddExamSections.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct AddExamSections: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var instructions = ""
    @State private var sectionTitle = ""
    @State private var SectionDescription = ""


    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()

            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("Add Instructions")
                        .foregroundColor(.darkGray)
                        .fontWeight(.medium)

                    TextField("", text: $instructions)
                        .padding(.horizontal)
                        .frame(minHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))

                    Text("Section Name")
                        .foregroundColor(.darkGray)
                        .fontWeight(.medium)

                    TextField("", text: $sectionTitle)
                        .padding(.horizontal)
                        .placeholder(when: sectionTitle.isEmpty, placeholder: {
                            Text("Section title").foregroundColor(.lightGray).opacity(0.7)
                                .padding(.horizontal)
                        })
                        .frame(minHeight: 50)
                        .background(RoundedRectangle(cornerRadius: 5)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))

                    ShadedTextEditor(text: $SectionDescription)
                        .frame(maxHeight: 120)

                    ExamQuestionView()



                    Button {
                        // Add Another Question
                    } label: {
                        HStack {
                            Spacer()
                            Text("Add another question")
                                .font(.headline)
                                .padding()
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
            AddExamSections()
        }
    }
}
