//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-11-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var taskNotes: UITextView!
   
    var taskIn: TaskObject? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskName.text = taskIn?.taskName
        taskNotes.text = taskIn?.taskNotes
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnUpdateClicked(_ sender: UIButton) {
        let tName = taskName.text!
        let tNotes = taskNotes.text!
        
        let task = TaskObject()
        task.taskName = tName
        task.taskNotes = tNotes
        task.taskProgress = (taskIn?.taskProgress)!
        task.isComplete = (taskIn?.isComplete)!
        
        RealmDB.realmMgr.createOrUpdateItemDB(task)
        // Go to the previous view
        //        self.dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDeleteClicked(_ sender: UIButton) {
    }
}
