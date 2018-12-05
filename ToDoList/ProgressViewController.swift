//
//  ProgressViewController.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-11-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    var taskIn: TaskObject? = nil
//17
    @IBOutlet weak var lblTaskName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //17
       // lblTaskName.text = taskNameIn
        taskName.text = taskIn?.taskName
        slider.value = Float((taskIn?.taskProgress)!)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        let progress = Int(slider.value)
        var isComplete = false
        if progress == 100{
            isComplete = true
        }
        var t = TaskObject()
        t.setTaskObject(itemID: (taskIn?.itemID)!, taskName: (taskIn?.taskName)!, taskNotes: (taskIn?.taskNotes)!, taskProgress: progress, isComplite: isComplete)
        //task.setTaskObject(name: <#T##String#>, notes: <#T##String#>)
        RealmDB.realmMgr.createOrUpdateItemDB(t)
    }
}
