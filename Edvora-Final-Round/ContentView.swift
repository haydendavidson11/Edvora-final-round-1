//
//  ContentView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct ContentView: View {

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.lightPink)
//        UITabBar.appearance().barTintColor = UIColor.systemBackground

    }

    var body: some View {


            TabView {
                Page1()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Page 1")
                    }

                Page2()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Page 2")
                    }

                Dashboard()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Dashboard")
                    }

                Exams()
                    .tabItem {
                        Image(systemName: "graduationcap")
                        Text("Exams")
                    }

                Page5()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Page 5")
                    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
