//
//  SignInView.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import SwiftUI

struct SignInView: View {
    @State var userEmail : String = ""
    @State var userPassword : String = ""
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
                
                Button {
                    print("login button clicked")
                } label: {
                    Text("Sign Up")
                        .loginSingUpBtnText()
                    
                }
                
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
        }
    }
}

#Preview {
    SignInView()
}
