//
//  AddTaskViewController.swift
//  Created by Elena Melnikova on 2018-12-04.
//  ToDoList
//  Student ID: 301025880
//  Description: AddTaskViewController to add new task.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    //Outlets for Task name and Task notes
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskNotes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Action for "Save" button clicked
    @IBAction func btnSaveTask(_ sender: UIButton) {

        //Create new Task Object
        let task = TaskObject()
        
        //Populate task
        task.setTaskObject(name: taskName.text!, notes: taskNotes.text!)
        
        //Call DB create operation
        RealmDB.realmMgr.createOrUpdateItemDB(task)

        //Return to main view
        _ = navigationController?.popViewController(animated: true)
    }
}
