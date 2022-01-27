//
//  QuestionOption.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import SwiftUI

struct QuestionOptionView: View {
    @State private var optionTitle = ""
    var editing: Bool

    @State var option: QuestionOption

    @Binding var optionsToBeRemoved: Set<QuestionOption>

    let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

//    var deleteAction: (_ id: String) -> Void
    var saveOption: (_ option: QuestionOption) -> Void

    var questionDescription: some View {
        HStack {
            Text(letters[option.position].uppercased())
                .bold()
                .foregroundColor(option.isAnswer ? .lightPink : .darkPink)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(option.isAnswer ? .darkPink : .questionPink))

            TextField("", text: $option.title)
                .padding(.leading)
                .placeholder(when: option.title.isEmpty) {
                    Text("Add Option...")
                        .foregroundColor(.lightGray).opacity(0.7)
                        .padding(.horizontal)
                }
                .submitLabel(.next)
                .onSubmit {
                    saveOption(option)
                }
        }
        .padding(5)
        .background(ZStack {
            if option.isAnswer {
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
            option.isAnswer.toggle()
        } label: {
            ZStack {
                Circle()
                    .strokeBorder(lineWidth: 1)
                    .foregroundColor(.darkPink)
                    .frame(width: 30)
                if option.isAnswer {
                    Circle()
                        .foregroundColor(.darkPink)
                        .frame(width: 20)
                }
            }
        }
    }


    var body: some View {
        HStack {

            selectButton

            questionDescription

            if editing {
                Button {
                    if optionsToBeRemoved.contains(option) {
                        if let pos = optionsToBeRemoved.firstIndex(of: option) {
                            optionsToBeRemoved.remove(at: pos)
                        }
                    } else {
                        optionsToBeRemoved.insert(option)
                    }
                } label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(optionsToBeRemoved.contains(option) ? .darkPink : .lightPink)
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
        QuestionOptionView(editing: false, option: QuestionOption.example1, optionsToBeRemoved: .constant([]), saveOption: {option in})
    }
}
