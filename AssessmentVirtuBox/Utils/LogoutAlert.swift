//
//  LogoutAlert.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI


struct ShowLogoutAlert {
    static func logoutAlert(isLoggedIn : Binding<Bool>) -> Alert {
        Alert(title: Text("Are you sure you want to logout?"), primaryButton: .destructive(Text("Logout"), action: {
//            UserDefaults.standard.set(false, forKey: "isLoggedIn")
              isLoggedIn.wrappedValue = false
        }), secondaryButton: .cancel())
    }
}
