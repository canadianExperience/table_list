//
//  ProgressViewController.swift
//  Created by Elena Melnikova on 2018-12-04.
//  ToDoList
//  Student ID: 301025880
//  Description: ProgressViewController to display and modify task progress.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    // Outlets for Task Name, Slider and Progress (%)
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    // Input task
    var taskIn: TaskObject? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Set Task name, Slider position and progress
        taskName.text = taskIn?.taskName
        slider.value = Float((taskIn?.taskProgress)!)
        lblProgress.text = String(Int(slider.value)) + " %"
    }
    
    // Action for Slider position changed
    @IBAction func sliderAction(_ sender: UISlider) {
        
        // Get slider progress position
        let progress = Int(slider.value)
        
        // Set completion status based on slider progress position
        var isComplete = false
        if progress == 100{
            isComplete = true
        }
        
        // Create Task Object
        let task = TaskObject()
        
        //Populate Task Object
        task.setTaskObject(itemID: (taskIn?.itemID)!, taskName: (taskIn?.taskName)!, taskNotes: (taskIn?.taskNotes)!, taskProgress: progress, isComplete: isComplete)
    
        // Set Task progress in %
        lblProgress.text = String(Int(slider.value)) + " %"
        
        //Call DB update operation
        RealmDB.realmMgr.createOrUpdateItemDB(task)
    }
}
