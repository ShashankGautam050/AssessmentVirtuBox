//
//  ForgotPassword.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var userEmail : String = ""
    @State private var userPassword : String = ""
    @State private var confirmPassword : String = ""
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""

    @Environment(\.dismiss) var dismiss
    var body: some View {
        ScrollView {
            
            VStack(spacing : 12){
                
                Image("login")
                    .imageStyleLoginSignUp()
                
                
                Text("Forget Password")
                    .loginSignUpHeading()
                
                
                TextField("Email", text: $userEmail)
                    .textFieldStyle()
                
                SecureField("New Password", text: $userPassword)
                    .textFieldStyle()
                
                SecureField("Confirm New Password", text: $confirmPassword)
                    .textFieldStyle()
                
                Button {
                    if userEmail.isEmpty || userPassword.isEmpty || confirmPassword.isEmpty {
                        alertTitle = "Error"
                        alertMessage = "Please fill all the fields"
                        showAlert = true
                        return
                    }
                    if userPassword.count < 8 {
                        alertTitle = "Error"
                        alertMessage = "Password should be minimum 8 characters"
                        showAlert = true
                        return
                    }
                    if userPassword != confirmPassword {
                        alertTitle = "Error"
                        alertMessage = "Password and Confirm Password does not match"
                        showAlert = true
                        return
                    }
                    if !EmailValidator.isValid(userEmail){
                        alertTitle = "Error"
                        alertMessage = "Please enter a valid email"
                        showAlert = true
                        return
                    }
                    // changing user password
                    let defaults = UserDefaults.standard
                    let registeredUsers = defaults.array(forKey: "users") as? [[String: String]]

                    // Ensure we have a users array
                    guard var users = registeredUsers, !users.isEmpty else {
                        return
                    }

                    // Find the index for the provided email
                    if let index = users.firstIndex(where: { $0["email"] == userEmail }) {
                        // Update the password for the found user
                        users[index]["password"] = userPassword
                        // Save back to UserDefaults
                        defaults.set(users, forKey: "users")

                        alertTitle = "Success"
                        alertMessage = "Password changed successfully"
                        showAlert = true

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            dismiss()
                        }
                    } else {
                        alertTitle = "Error"
                        alertMessage = "No user registered with this email"
                        showAlert = true
                        return
                    }
                    
                    
                } label: {
                    Text("Change Password")
                        .loginSingUpBtnText()
                    
                }
                .btnTOuchEffect()
                
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert){
                AlertManager.showAlert(title: alertTitle, message: alertMessage)
            }
        }
    }
}

#Preview {
    ForgotPassword()
}
