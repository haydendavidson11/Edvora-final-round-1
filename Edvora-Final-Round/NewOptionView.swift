//
//  NewOptionView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/26/22.
//

import SwiftUI

struct NewOptionView: View {

    @State private var option = QuestionOption()
    @State private var showAlert = false

    var questionCount: Int

    var saveOption: (_ option: QuestionOption) -> Void

    let letters = ["b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

    var letter: String {
        if questionCount == 0 {
            return "A"
        } else if questionCount == 25 {
            return "Z"
        } else {
//            guard questionCount <= 24 else { return "Z" }
            return letters[questionCount - 1].uppercased()
        }
    }

    var body: some View {
        HStack {
            Text(letter)
                .bold()
                .foregroundColor(.darkPink)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.questionPink))

            TextField("", text: $option.title)
                .padding(.leading)
                .placeholder(when: option.title.isEmpty) {
                    Text("Add Option...")
                        .foregroundColor(.lightGray).opacity(0.7)
                        .padding(.horizontal)
                }
                .submitLabel(.next)
                .onSubmit {
                    if questionCount == 26 {
                        showAlert = true
                    } else {
                    option.position = questionCount
                    saveOption(option)
                    self.option = QuestionOption()
                    }
                }
        }
        .padding(5)
        .background(
                RoundedRectangle(cornerRadius: 5)
                            .strokeBorder()
                            .foregroundColor(.questionPink)
        )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Oops"), message: Text("The max number of options per questions is 26"), dismissButton: .default(Text("OK")))
        }
    }
}

struct NewOptionView_Previews: PreviewProvider {
    static var previews: some View {
        NewOptionView(questionCount: 5, saveOption: {option in})
    }
}
