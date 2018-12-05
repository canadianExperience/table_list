//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-12-05.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskName: UITextField!
    
    @IBOutlet weak var taskNotes: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnSaveTask(_ sender: UIButton) {
        
        let taskNameText: String = taskName.text!
        let taskNotesText: String = taskNotes.text!
        //Save to db
        var task = TaskObject()
        
        task.taskName = taskNameText
        task.taskNotes = taskNotesText
        task.taskProgress = 0
        task.isComplete = false
        
        RealmDB.realmMgr.createOrUpdateItemDB(task)
        // Go to the previous view
//        self.dismiss(animated: true, completion: nil)
        _ = navigationController?.popViewController(animated: true)
    }
}
