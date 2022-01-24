//
//  Dashboard.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct Dashboard: View {
 @State private var showingAttendanceData = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                    .ignoresSafeArea(edges: [.leading, .trailing, .top])

                VStack {
                    WelcomeUserView(user: User.example)

                    ExaminationsView()

                    AttendanceView()


                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
