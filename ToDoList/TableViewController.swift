//
//  TableViewController.swift
//  ToDoList
//
//  Created by Elena Melnikova on 2018-11-29.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

// Sample data structure for Task
struct CellData{
    let taskID: String;
    let taskName: String;
}

class TableViewController: UITableViewController

{
    
    @IBOutlet weak var tabView: UITableView!
    
    //Data array for TableView
    var data = [CellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        //8
        tabView.delegate = self
        tabView.dataSource = self
        
        data =
            [
            CellData.init(taskID: "1", taskName: "Task_1"),
            CellData.init(taskID: "2", taskName: "Task_2"),
            CellData.init(taskID: "3", taskName: "Task_3"),
            CellData.init(taskID: "4", taskName: "Task_4"),
            CellData.init(taskID: "5", taskName: "Task_5")
            ]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //9
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //10
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    //11
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        
        cell.setCell(cellData: data[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "toProgress", sender: cell)
    }
    
    // Function to prepere segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "toProgress",
            let destination = segue.destination as? ProgressViewController,
            let index = tabView.indexPathForSelectedRow?.row{
            destination.taskNameIn = data[index].taskName
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnAddTaskClicked(_ sender: UIButton) {
        print("Add Task Clicked")
    }
    
}
