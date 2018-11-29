//
//  CustomCell.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-11-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell
{
    
    @IBOutlet weak var lblTaskName: UILabel!
    @IBOutlet weak var btnDetails: UIButton!
    
    var taskID: String = "";
    var taskName: String = "";
    
    func setCell(cellData: CellData) {
         lblTaskName.text = cellData.taskName

    }
}
