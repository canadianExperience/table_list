//
//  DetailsViewController.swift
//  Created by Elena Melnikova on 2018-12-04.
//  ToDoList
//  Student ID: 301025880
//  Description: DetailsViewController to display, update task data and delete task.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // Outlets for Task name and Task notes
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskNotes: UITextView!
   
    //Input task
    var taskIn: TaskObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set Task name from input task
        taskName.text = taskIn?.taskName
        
        //Set Task notes from input task
        taskNotes.text = taskIn?.taskNotes
    }

    // Update button action
    @IBAction func btnUpdateClicked(_ sender: UIButton) {
        // Create new task object and populate
        let task = TaskObject()
        task.itemID = (taskIn?.itemID)!
        task.taskName = taskName.text!
        task.taskNotes = taskNotes.text!
        task.taskProgress = (taskIn?.taskProgress)!
        task.isComplete = (taskIn?.isComplete)!
        
        //Perform DB update or create operation
        RealmDB.realmMgr.createOrUpdateItemDB(task)
        
        //Return to main view
        _ = navigationController?.popViewController(animated: true)
    }
    
    // Delete button action
    @IBAction func btnDeleteClicked(_ sender: UIButton) {
        //Get item TD to delete element
        let itemID = (taskIn?.itemID)!
        
        //Perform DB delete operation
        RealmDB.realmMgr.deleteItemDB(itemID)
       
        //Return to main view
        _ = navigationController?.popViewController(animated: true)
    }
}
