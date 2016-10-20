//
//  ToDoListViewController.swift
//  ToDo2
//
//  Created by Aneesh Khera on 10/18/16.
//  Copyright © 2016 Aneesh Khera. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    var tasks = [Task]()
    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.leftBarButtonItem = self.editButtonItem
        _ = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ToDoListViewController.purge), userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = tasks[indexPath.row].title
        if self.tasks[indexPath.row].isComplete() {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true // We want the items to be editable
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.tasks.remove(at: indexPath.row)
        }
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.tasks[indexPath.row].isComplete() {
            self.tasks[indexPath.row].makeIncomplete()
        } else {
            self.tasks[indexPath.row].makeComplete()
        }
        self.tableView.reloadData()
    }
    
    func purge() {
        if self.tasks.count > 0{
            for i in (0...self.tasks.count-1).reversed() {
                let isOver = self.tasks[i].overTime()
                if isOver {
                    self.tasks.remove(at: i)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "statid" {
            let new = segue.destination as! StatsTableViewController
            var newList = [Task]()
            for item in self.tasks{
                if item.isComplete() == true {
                    newList.append(item)
                }
            }
            new.completedTasks = newList
            new.tableView.reloadData()
        }
    }
}
