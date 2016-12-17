//
//  TaskManager.swift
//  reMind
//
//  Created by Benjamín Garrido Barreiro on 17/12/16.
//  Copyright © 2016 Benjamín Garrido Barreiro. All rights reserved.
//

import Foundation

class TaskManager {
    static let sharedInstance = TaskManager()
    
    var tasks : [[String: String]] = [[String: String]]()
    
    func save() {
        UserDefaults.standard.set(tasks, forKey: "tasks")
    }
    func load() {
        if let array = UserDefaults.standard.array(forKey: "tasks") as? [[String: String]] {
            tasks = array
        }
    }
}
