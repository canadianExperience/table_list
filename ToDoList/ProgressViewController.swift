//
//  ProgressViewController.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-11-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    
    var taskNameIn: String = ""
//17
    @IBOutlet weak var lblTaskName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //17
        lblTaskName.text = taskNameIn

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

    //Back button action (go back to Table View Controller)
    @IBAction func btnBackClicked(_ sender: UIButton) {
        //print("btnBack Clicked")
        
        self.dismiss(animated: true, completion: nil)
    }
}
