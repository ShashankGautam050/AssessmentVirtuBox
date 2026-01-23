//
//  ContentView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct LoginView: View {
    
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
                        
                        // check either user registered or not,if registered navigate to home screen otherwise show error
                        let defaults = UserDefaults.standard
                        guard let registeredUser = defaults.array(forKey: "users") as? [[String: String]] else {
                            alertTitle = "Error"
                            alertMessage = "No User Found. Please Sign Up"
                            showAlert = true
                            return
                            
                        }
                        // finding matching user
                        
                        if let _ = registeredUser.first(where: {$0["email"] == userEmail && $0["password"] == userPassword} ) {
                            alertTitle = "Success"
                            alertMessage = "Login Successful"
                            showAlert = true
                            
                            
                           // setting value true so we can track users current state
                            UserDefaults.standard.set(true, forKey: "isLoggedIn")
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                navigateToHome = true
                            }
                        }
                        else {
                            alertTitle = "Error"
                            alertMessage = "Invalid Email or Password"
                            showAlert = true
                            return
                        }
                       

                    } label: {
                        Text("Login")
                            .loginSingUpBtnText()
                        
                    }
                    .btnTOuchEffect()
                    HStack{
                        Spacer()
                        NavigationLink {
                            ForgotPassword()
                        } label: {
                            Text("Forgot Password?")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }

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
                .fullScreenCover(isPresented: $navigateToHome){
                    HomeView()
                    
                }
                .alert(isPresented : $showAlert){
                    AlertManager.showAlert(title: alertTitle, message: alertMessage)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}


