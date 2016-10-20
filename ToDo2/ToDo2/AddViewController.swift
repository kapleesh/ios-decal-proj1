//
//  AddViewController.swift
//  ToDo2
//
//  Created by Aneesh Khera on 10/18/16.
//  Copyright © 2016 Aneesh Khera. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "Next"){
            let next:Task = Task(title: titleTextField.text!)
            let new = segue.destination as! ToDoListViewController
            new.tasks.append(next)
            new.tableView.reloadData()
        }
        
    }
    
    
}
