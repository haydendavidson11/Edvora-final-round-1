//
//  ExaminationsView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct ExaminationsView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        VStack {
            HStack {
                Text("Examinations")
                    .foregroundColor(.darkGray)
                    .fontWeight(.bold)
                Spacer()

                Button {
                    state.setSelectedTab = "exams"
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.lightPink)
                }

            }

            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(state.exams) { exam in
                        ExamCardView(exam: exam)
                    }
                }
            }
            .frame(maxHeight: 180)
        }
        .padding()
        .background(Color(uiColor: .systemBackground))
    }
}

struct ExaminationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExaminationsView()
    }
}
