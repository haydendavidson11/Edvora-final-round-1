//
//  ShadedTextEditor.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct ShadedTextEditor: View {
    @Binding var text: String



    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .cornerRadius(5)

            VStack {
                TextField("", text: $text)
                    .padding()
                    .placeholder(when: text.isEmpty) {
                        Text("Section Description (Optional)")
                            .foregroundColor(.lightGray).opacity(0.7)
                            .padding()
                    }
                Spacer()
            }

        }
        .frame(minHeight: 120)
    }
}

//struct ShadedTextEditor_Previews: PreviewProvider {
//    static var previews: some View {
//        ShadedTextEditor()
//    }
//}
