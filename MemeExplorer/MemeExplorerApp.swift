//
//  MemeExplorerApp.swift
//  MemeExplorer
//
//  Created by Khang Vu on 15/11/20.
//

import SwiftUI

@main
struct MemeExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(memeData: testData)
        }
    }
}

// MARK: - Test Data

class MemeData: ObservableObject, Identifiable {
    let id = UUID()
    var title: String
    var image: String
    var topValue: String
    var bottomValue: String
    
    init(title: String,
         image: String,
         topValue: String,
         bottomValue: String) {
        self.title = title
        self.image = image
        self.topValue = topValue
        self.bottomValue = bottomValue
    }
}

let testData = [
    MemeData(title: "Khang", image: "selfie", topValue: "", bottomValue: ""),
    MemeData(title: "Khang 2", image: "selfie", topValue: "", bottomValue: ""),
]

