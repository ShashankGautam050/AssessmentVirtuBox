//
//  ContentView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userEmail : String = ""
    @State private var userPassword : String = ""
    @State private var isPresent : Bool = false
    
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var navigateToHome: Bool = false
    
    var body: some View {
       
        NavigationStack {
            ScrollView {
                VStack(spacing : 12){
                    // code to naviagte to home screen after all the validation 
                    NavigationLink(
                        destination: HomeView(),
                        isActive: $navigateToHome
                    ) {
                        EmptyView()
                    }
                    Image("login")
                        .imageStyleLoginSignUp()
                    
                    Text("Welcome to the App")
                        .loginSignUpHeading()
                    
                    
                    TextField("Email", text: $userEmail)
                        .textFieldStyle()
                    
                    SecureField("Password", text: $userPassword)
                        .textFieldStyle()
                    
                    Button {
                        if userEmail.isEmpty || userPassword.isEmpty {
                            alertTitle = "Error"
                            alertMessage = "Please fill all the fields"
                            showAlert = true
                            return
                        }
                        
                        if !EmailValidator.isValid(userEmail){
                            alertTitle = "Error"
                            alertMessage = "Please enter a valid email"
                            showAlert = true
                            return
                        }
                        if userPassword.count < 8 {
                            alertTitle = "Error"
                            alertMessage = "Password should be minimum 8 characters"
                            showAlert = true
                            return
                        }
                        alertTitle = "Success"
                        alertMessage = "Login Successful"
                        showAlert = true
                       
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                          navigateToHome = true
                        }
                       

                    } label: {
                        Text("Login")
                            .loginSingUpBtnText()
                        
                    }
                    
                    Button {
                        isPresent.toggle()
                    } label: {
                        Text("Don't have an account? Sign Up")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.vertical)
                    }
                    .btnTOuchEffect()
                    
                    
                    
                    
                    Spacer()
                }
                .sheet(isPresented: $isPresent, content: {
                    SignInView()
                        .presentationDragIndicator(.visible)
                })
                .padding()
                .alert(isPresented : $showAlert){
                    AlertManager.showAlert(title: alertTitle, message: alertMessage)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


