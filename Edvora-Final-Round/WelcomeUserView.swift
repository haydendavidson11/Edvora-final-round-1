//
//  WelcomeUserView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct WelcomeUserView: View {
    var user: User

    var body: some View {
        HStack {
            VStack {
                Text("Hello \(user.name)")
                    .font(.title)
                    .foregroundColor(.darkPink)
                Text("Welcome to your")
                    .font(.caption)
                    .foregroundColor(.lightPink)
                +
                Text(" Dashboard")
                    .foregroundColor(.lightPink)
                    .font(.caption)
                    .bold()
            }
            Spacer()

            user.image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Color.lightPink.opacity(0.3))
                .clipShape(Circle())


        }
        .padding()
    }
}

struct WelcomeUserView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeUserView(user: User.example)
    }
}
