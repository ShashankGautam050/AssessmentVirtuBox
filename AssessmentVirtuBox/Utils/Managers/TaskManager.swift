//
//  TaskManager.swift
//  AssessmentVirtuBox
//
//  Created by Shashank Gautam on 22/01/26.
//

import Foundation


struct TaskManager {
    
//    static private let key = "savedTasks"
    // MARK: - Get key for current user
        private static func userTaskKey() -> String? {
            guard let email = UserDefaults.standard.string(forKey: "loggedInUserEmail") else {
                return nil
            }
            return "savedTasks_\(email)"
        }
    static func saveTasks(_ tasks : [Tasks]) {
        guard let key = userTaskKey() else { return }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks){
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    static func load() -> [Tasks]? {
        guard let key = userTaskKey() else { return [] }
        guard let data = UserDefaults.standard.data(forKey: key),let tasks = try? JSONDecoder().decode([Tasks].self, from: data) else {
            return []
        }
        return tasks
    }
}
