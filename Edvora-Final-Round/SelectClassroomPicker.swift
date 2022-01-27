//
//  SelectClassroomPicker.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct SelectClassroomPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var classroom: Classroom

    @State private var showPicker = false


    var body: some View {

        HStack() {
            Text(classroom.title.isEmpty ? "Select Classroom" : classroom.title)
                .foregroundColor(.darkGray.opacity(0.8))
            Spacer()
            Image(systemName: "chevron.right").rotationEffect(Angle(degrees: 90))
                .foregroundColor(.lightPink)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(uiColor: .secondarySystemBackground)))
        .onTapGesture {
            withAnimation {
                showPicker = true
            }
        }
        .fullScreenCover(isPresented: $showPicker) {
            ClassroomPicker(classroom: $classroom)
        }

    }
}

//struct SelectClassroomPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectClassroomPicker()
//    }
//}


struct ClassroomPicker: View  {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var state: AppState

    @Binding var classroom: Classroom

    var body: some View {
        VStack {
            Text("Select a Classroom")

            List {
                ForEach(state.classes.allClasses, id: \.self) { room in
                    Text(room.title)
                        .onTapGesture {
                            self.classroom = room
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
        }
    }

   
}
