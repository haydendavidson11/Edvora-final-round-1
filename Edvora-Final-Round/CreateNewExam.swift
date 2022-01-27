//
//  CreateNewExam.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct CreateNewExam: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var state: AppState

    @State var exam = Examination()

    @State private var date = ""
    @State private var time = ""
    @State private var duration = ""
    @State private var timeFrame = ""
    @State private var totalMarks = ""
    @State private var category = ""


    var calendarImage: Image {
        return Image(systemName: "calendar")
    }

    var clockImage: Image {
        return Image(systemName: "clock")
    }

    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.secondarySystemBackground

    }

    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea(edges: [.leading, .trailing, .top])
            VStack {
                VStack {
                    HStack {
                        Text("Classroom:")
                        Spacer()
                        SelectClassroomPicker(classroom: $exam.classroom)
                            .frame(maxWidth: 280)

                    }

                    HStack {
                        Text("Syllabus:")
                        Spacer()
                        TextField("", text: $exam.syllabus)
                            .placeholder(when: exam.syllabus.isEmpty) {
                                Text("Enter modules here").foregroundColor(.lightPink)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 280)
                    }

                    HStack {
                        Text("Date:")
                        Spacer()
                        TextField("", text: $exam.date)
                            .placeholder(when: exam.date.isEmpty) {
                                Text("DD / MM / YY  \(calendarImage)").foregroundColor(.lightPink)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 165)

                    }

                    HStack {
                        Text("Time:")
                        Spacer()
                        TextField("", text: $exam.time)
                            .placeholder(when: exam.time.isEmpty) {
                                Text("HR : MN : SC  \(clockImage)").foregroundColor(.lightPink)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 165)

                    }

                    HStack {
                        Text("Duration:")
                        Spacer()
                        TextField("", text: $exam.duration)
                            .placeholder(when: exam.duration.isEmpty) {
                                Text("HR | MN").foregroundColor(.lightPink)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 100)


                    }

                    HStack {
                        Text("Timeframe:")
                        Spacer()
                        TextField("", text: $exam.timeFrame)
                            .placeholder(when: exam.timeFrame.isEmpty) {
                                Text("HR | MN").foregroundColor(.lightPink)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 100)

                    }

                    HStack {
                        Text("Total Marks:")
                        Spacer()
                        TextField("", text: $exam.totalMarks)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 100)

                    }

                    HStack {
                        Text("Category:")
                        Spacer()
                        TextField("", text: $category)
                            .placeholder(when: category.isEmpty) {
                                Text("Internal, mock, ect").foregroundColor(.lightPink)
                                    .font(.footnote)
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5)
                                            .foregroundColor(Color(uiColor: .secondarySystemBackground)))
                            .frame(maxWidth: 165)

                    }


                }

                .padding()
                .background(Color(uiColor: .systemBackground))
                .offset(y: 1)

                Spacer()
            }
            .background(Color(uiColor: .secondarySystemBackground))

        }.toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.state.setSelectedTab = "dashboard"
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
                NavigationLink(destination: AddExamSections(section: $exam.sections.first!, saveExam: saveExam)) {
                    Text("Next")
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

    func saveExam() {
        state.exams.append(exam)
    }

}

struct CreateNewExam_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateNewExam()
        }
    }
}
