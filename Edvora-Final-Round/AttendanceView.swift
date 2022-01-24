//
//  AttendanceView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct AttendanceView: View {

    @State private var showingAttendanceData = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Attendance")
                .foregroundColor(.darkGray)
                .fontWeight(.bold)

            HStack(spacing: 20) {
                Text("Data Structures & Algorithms")
                    .foregroundColor(.darkPink)
                    .fontWeight(.medium)
                Button {
                    // Show attendance data view
                    withAnimation {
                        self.showingAttendanceData.toggle()
                    }

                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.lightPink)
                        .rotationEffect(Angle(degrees: showingAttendanceData ? 90 : 0))
                }
                Spacer()
            }

            if showingAttendanceData {
                    AttendanceDataView()
            }

        }
        .animation(.default)
        .padding()
        .background(Color(uiColor: .systemBackground))
    }
}

struct AttendanceView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceView()
    }
}
