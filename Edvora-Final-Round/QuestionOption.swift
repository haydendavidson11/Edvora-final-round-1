//
//  QuestionOption.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct QuestionOption: View {
    @State private var selected = false
    @State private var optionTitle = ""
    @State private var selectable = true
    @State private var editing = true

    var questionDescription: some View {
        HStack {
            Text("A")
                .bold()
                .foregroundColor(selected ? .lightPink : .darkPink)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(selected ? .darkPink : .questionPink))

            TextField("", text: $optionTitle)
                .padding(.leading)
                .placeholder(when: optionTitle.isEmpty) {
                    Text("Option One")
                }
        }
        .padding(5)
        .background(ZStack {
            if selected {
                RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.questionPink)
            } else {
                RoundedRectangle(cornerRadius: 5)
                            .strokeBorder()
                            .foregroundColor(.questionPink)
            }
        })
    }


    var selectButton: some View {
        Button {
            self.selected.toggle()
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(lineWidth: 1)
                    .foregroundColor(.darkPink)
                    .frame(width: 30)
                if selected {
                    Circle()
                        .foregroundColor(.darkPink)
                        .frame(width: 20)
                }
            }
        }
    }


    var body: some View {
        HStack {
            if selectable {
                selectButton
            } else {
                Spacer()
            }
            questionDescription

            if editing {
                Button {
                    // delete option from question
                } label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.lightPink)
                        .frame(width: 30)
                }

            } else {
                Spacer()
            }
        }
    }
}

struct QuestionOption_Previews: PreviewProvider {
    static var previews: some View {
        QuestionOption()
    }
}
