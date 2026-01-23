//
//  SignInView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct SignInView: View {
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
                
                
                Text("Sign Up")
                    .loginSignUpHeading()
                
                
                TextField("Email", text: $userEmail)
                    .textFieldStyle()
                
                SecureField("Password", text: $userPassword)
                    .textFieldStyle()
                
                SecureField("Confirm Password", text: $confirmPassword)
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
                    
                    
                    // checking either the given credentials are already register or not
                    let defaults = UserDefaults.standard
                    
                    
                    // all the registered user
                    var users = defaults.array(forKey: "users") as? [[String: String]] ?? []
                    
                    // checking existing user using mail
                    if users.contains(where: {$0["email"] == userEmail}) {
                        alertTitle = "Error"
                        alertMessage = "User already exists,Please login"
                        showAlert = true
                        return
                    }
                    
                    // saving new user credentials using userdefaults
                    let newUser: [String: String] = [
                        "email": userEmail,
                        "password": userPassword
                    ]

                    // append in the array
                    users.append(newUser)
                    UserDefaults.standard.set(users, forKey: "users")
                   
                    
                    alertTitle = "Success"
                    alertMessage = "Sign Up Successful"
                    showAlert = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        dismiss()
                    }
                } label: {
                    Text("Sign Up")
                        .loginSingUpBtnText()
                    
                }
                .btnTOuchEffect()
                
                Button {
                    dismiss()
                } label: {
                    Text("Already have an account?")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.vertical)
                }
                
                
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
    SignInView()
}
