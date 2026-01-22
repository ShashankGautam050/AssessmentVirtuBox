//
//  AssessmentVirtuBoxApp.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

@main
struct AssessmentVirtuBoxApp: App {
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some Scene {

        WindowGroup {
            if isLoggedIn {
                HomeView()
            } else {
                ContentView()
            }
        }
    }
}
