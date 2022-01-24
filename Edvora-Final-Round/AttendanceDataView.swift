//
//  AttendanceDataView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct AttendanceDataView: View {
    @State private var lowAttendance = true

    @State private var progress = 0.75

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
                            Text("Classes Classes")

                        // Classes Missed
                            Text("Missed Classes")

                        // Classes Left
                            Text("Classes Left")

                    }

                    VStack(spacing: 10) {
                        // Total Classes
                        Text("70")
                        // classes Attended
                        Text("70")
                        // Classes Missed
                        Text("70")
                        // Classes Left
                        Text("70")
                    }
                }

            }

            if lowAttendance {
                HStack {

                    Spacer()

                    Label {
                        Text("Your attendance seems to be low in DSA")
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
    }
}

struct AttendanceDataView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceDataView()
    }
}
