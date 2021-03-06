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
    var time: NSDate?
    var complete: Bool!
    var deleted: Bool!
    
    init(title: String) {
        self.title = title
        self.complete = false
        self.deleted = false
    }
    
    func makeComplete() {
        if self.complete == false {
            self.complete = true
            self.time = NSDate()
        }
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
