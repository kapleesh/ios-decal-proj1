//
//  StatsTableViewController.swift
//  ToDo2
//
//  Created by Aneesh Khera on 10/18/16.
//  Copyright © 2016 Aneesh Khera. All rights reserved.
//

import UIKit

class StatsTableViewController: UITableViewController {
    var completedTasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(StatsTableViewController.purge), userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return completedTasks.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatsComplete", for: indexPath)
        
        // Configure the cell
        cell.textLabel?.text = "(" + String(indexPath.row + 1) + ")     " + completedTasks[indexPath.row].title
        return cell
    }
    
    func purge() {
        if self.completedTasks.count > 0{
            for i in (0...self.completedTasks.count-1).reversed() {
                let isOver = self.completedTasks[i].overTime()
                if isOver {
                    self.completedTasks.remove(at: i)
                }
            }
        }
        self.tableView.reloadData()
    }
    
}
