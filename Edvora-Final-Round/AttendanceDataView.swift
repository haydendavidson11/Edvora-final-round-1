//
//  AttendanceDataView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct AttendanceDataView: View {
    @EnvironmentObject var state: AppState

    @State private var lowAttendance = true

    @State private var progress = 0.75

    var lowAttendedClass: Classroom? {
        return state.lowestAttendedClass(for: state.user)
    }

    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 20) {

                AttendanceProgressView()
                    .frame(width: 150)

                Group {
                    VStack(alignment: .leading, spacing: 10) {
                        // Total Classes
                            Text("Total Classes")

                        // classes Attended
                            Text("Classes Attended")

                        // Classes Missed
                            Text("Missed Classes")

                        // Classes Left
                            Text("Classes Left")

                    }

                    VStack(spacing: 10) {
                        // Total Classes
                        Text("\(state.classes.allClasses.count)")
                        // classes Attended
                        Text("\(state.attendedClasses())")
                        // Classes Missed
                        Text("\(state.missedClasses())")
                        // Classes Left
                        Text("\(state.classesLeft())")
                    }
                }

            }

            if lowAttendance {
                HStack {

                    Spacer()

                    Label {
                        Text("Your attendance seems to be low in \(lowAttendedClass?.title ?? "JS 101")")
                    } icon: {
                        Image(systemName: "bell.fill")
                    }
                    .padding()
                    .background(Color.blue.opacity(0.21)
                                    .cornerRadius(10))

                    Spacer()
                }

            }
        }
        .onAppear {
            if lowAttendedClass != nil {
                self.lowAttendance = true
            }
        }
    }
}

struct AttendanceDataView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceDataView()
    }
}
