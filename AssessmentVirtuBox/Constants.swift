//
//  Constants.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import Foundation
import SwiftUI


extension TextField {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.blue, lineWidth: 3)
        }
    }
        
}
extension SecureField {
    func textFieldStyle() -> some View {
        self
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.blue, lineWidth: 3)
        }
    }
        
}

extension Text {
    func loginSignUpHeading() -> some View {
        self
            .font(.title)
            .foregroundStyle(.blue)
            .padding(.vertical)
            .bold()
    }
    
    func loginSingUpBtnText() -> some View {
        self
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(12)
    }
}

extension Image {
    func imageStyleLoginSignUp() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(height: 250)
            .padding(.vertical,24)
        
    }
}


