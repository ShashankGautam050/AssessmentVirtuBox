//
//  ContentView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var userEmail : String = ""
    @State var userPassword : String = ""
    @State var isPresent : Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing : 12){
                    Image("login")
                        .imageStyleLoginSignUp()
                    
                    Text("Welcome to the App")
                        .loginSignUpHeading()
                    
                    
                    TextField("Email", text: $userEmail)
                        .textFieldStyle()
                    
                    SecureField("Password", text: $userPassword)
                        .textFieldStyle()
                    
                    Button {
                        print("login button clicked")
                    } label: {
                        Text("Login")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                        
                    }
                    
                    Button {
                        isPresent.toggle()
                    } label: {
                        Text("Don't have an account? Sign Up")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding(.vertical)
                    }
                    
                    
                    Spacer()
                }
                .sheet(isPresented: $isPresent, content: {
                    SignInView()
                        .presentationDragIndicator(.visible)
                })
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
