//
//  PersistentController.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 23/01/26.
//

import CoreData

struct PersistentController {
    static let shared = PersistentController()
    
    let container : NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "AssessmentVirtuBox")
        container.loadPersistentStores { _, error in
            if let error = error {
               fatalError("Core Data loading failed: \(error)")
            }
        }
    }
    
    }
