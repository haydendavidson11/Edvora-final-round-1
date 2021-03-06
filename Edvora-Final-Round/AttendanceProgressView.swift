//
//  AttendanceProgressView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct AttendanceProgressView: View {
    @EnvironmentObject var state : AppState

    @State private var progress = 0.0


    var body: some View {
            ZStack {
                Circle()
                    .stroke(lineWidth: 15)
                    .opacity(0.1)

                Text("\(progress * 100, specifier: "%g")%")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.darkGreen)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.buttonGreen)
                    .rotationEffect(Angle(degrees: -90))
            }
            .padding()
            .onAppear {
                withAnimation {
                    if let classroom = state.lowestAttendedClass(for: state.user) {
                        progress = classroom.attendance
                    }
                }
            }
    }
}

struct AttendanceProgressView_Previews: PreviewProvider {
    static var previews: some View {
        AttendanceProgressView()
    }
}
