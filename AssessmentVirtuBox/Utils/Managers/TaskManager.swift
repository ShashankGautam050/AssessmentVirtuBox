//
//  TaskManager.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import Foundation


struct TaskManager {
    
    static private let key = "savedTasks"
    
    static func saveTasks(_ tasks : [Tasks]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks){
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    static func load() -> [Tasks]? {
        
        guard let data = UserDefaults.standard.data(forKey: key),let tasks = try? JSONDecoder().decode([Tasks].self, from: data) else {
            return []
        }
        return tasks
    }
}
