//
//  DetailsViewController.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-11-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    

    @IBOutlet weak var lblTaskName: UILabel!
    var taskNameIn: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTaskName.text = taskNameIn
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnCancel(_ sender: UIButton) {
    }
}
