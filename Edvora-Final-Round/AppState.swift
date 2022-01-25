//
//  AppState.swift
//  Edvora-Final-Round
//
//  Created by Hayden Davidson on 1/25/22.
//

import Foundation

class AppState: ObservableObject {
    @Published var selectedTab = "dashboard"

    var setSelectedTab = "dashboard" {
        didSet {
            self.selectedTab = setSelectedTab
        }
    }
}
