//
//  ContentView.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/24/22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var state = AppState()



    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.lightPink)


    }

    var body: some View {


        TabView(selection: $state.selectedTab) {
                Page1()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Page 1")
                            .onTapGesture {
                                state.selectedTab = "page1"
                            }
                    }
                    .tag("page1")

                Page2()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Page 2")
                            .onTapGesture {
                                state.selectedTab = "page2"
                        }
                    }
                    .tag("page2")

                Dashboard()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Dashboard")
                            .onTapGesture {
                                state.selectedTab = "dashboard"
                        }
                    }
                    .tag("dashboard")
                    .environmentObject(state)

                Exams()
                    .tabItem {
                        Image(systemName: "graduationcap")
                        Text("Exams")
                            .onTapGesture {
                                state.selectedTab = "exams"
                        }
                    }
                    .tag("exams")

                Page5()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Page 5")
                            .onTapGesture {
                                state.selectedTab = "page5"
                        }
                    }
                    .tag("page5")
        }
        .environmentObject(state)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
