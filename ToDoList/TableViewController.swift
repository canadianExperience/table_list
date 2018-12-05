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
//// 21 Define protocol to call method located in TableViewController from cell
//protocol MyCustomCellDelegator {
//    func callSegueFromCell(cell: CustomCell)
//
//}

class TableViewController: UITableViewController
//    , MyCustomCellDelegator

{
    
    private static let cellIdentifier = "custom"
//    func callSegueFromCell(cell: CustomCell) {
//        self.performSegue(withIdentifier: "toDetails", sender: cell)
//    }

    
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
       // let cell = tableView.dequeueReusableCell(withIdentifier: "custom") as! CustomCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.cellIdentifier, for: indexPath)
        cell.textLabel?.text = data[indexPath.row].taskName
     //   cell.setCell(cellData: data[indexPath.row])
        //25
       // cell.delegate = self
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
//        performSegue(withIdentifier: "toProgress", sender: cell)
//    }
    
    // Function to prepere segue for Progress and Details View Controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewCell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: tableViewCell)
        
        if segue.identifier == "toProgress"{
            let destination = segue.destination as? ProgressViewController
           
        } else if segue.identifier == "toDetails"{
            let destination = segue.destination as? DetailsViewController
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
