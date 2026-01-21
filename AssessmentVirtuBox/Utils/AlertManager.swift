//
//  AlertManager.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//
import SwiftUI

struct AlertManager {
    static func showAlert(title : String,message: String)-> Alert {
        Alert(title : Text(title),message : Text(message),dismissButton: .default(Text("OK")))
        
    }
}
