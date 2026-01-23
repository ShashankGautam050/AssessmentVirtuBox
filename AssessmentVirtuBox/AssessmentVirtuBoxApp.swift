//
//  AssessmentVirtuBoxApp.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI
import CoreData

@main
struct AssessmentVirtuBoxApp: App {
    let persistentController = PersistentController()
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some Scene {

        WindowGroup {
            if isLoggedIn {
                HomeView()
                    .environment(\.managedObjectContext,persistentController.container.viewContext)
            } else {
                LoginView()
            }
        }
    }
}
