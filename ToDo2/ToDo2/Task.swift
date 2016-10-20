//
//  Task.swift
//  ToDo2
//
//  Created by Aneesh Khera on 10/18/16.
//  Copyright © 2016 Aneesh Khera. All rights reserved.
//

import Foundation


class Task {
    var title: String!
    var complete: Bool!
    var time: NSDate?
    
    init(title: String) {
        self.title = title
        self.complete = false
    }
    
    func makeComplete() {
        self.complete = true
        self.time = NSDate()
    }
    func makeIncomplete() {
        self.complete = false
        self.time = nil
    }
    func isComplete() -> Bool {
        return self.complete
    }
    func overTime() -> Bool {
        if self.time != nil {
            let now = NSDate()
            if now.timeIntervalSince(self.time as! Date) > 86400.0 {
                return true
            }
            
        }
        return false
    }
    
}
