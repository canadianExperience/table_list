//
//  TableViewController.swift
//  Created by Elena Melnikova on 2018-12-04.
//  ToDoList
//  Student ID: 301025880
//  Description: Main TableViewController holds list of tasks and "Add Task" buton
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController
{
    // Custom cell identifier
    private static let cellIdentifier = "custom"

    // TableView outlet
    @IBOutlet weak var tabView: UITableView!
    
    //Data array for TableView
    var data = [TaskObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update table
        update()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update table
        update()
    }
    
    // Update table from DB
    func update(){
        // Read data from DB
        if RealmDB.realmMgr.readAllDataDB() != nil{
            data = RealmDB.realmMgr.readAllDataDB()!
        } else {
            data = []
        }
        
        // Update TableView
        tabView.reloadData()
    }

    // MARK: - Table view data source
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //  Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    // Return table cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        //Get table cell by index
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewController.cellIdentifier, for: indexPath)
        
        // Set text for table cell
        cell.textLabel?.text = data[indexPath.row].taskName
        
        //  Grey out cell based on completion status
        if data[indexPath.row].isComplete {
            cell.backgroundColor = UIColor.gray
        } else {
            cell.backgroundColor = UIColor.white
        }

        return cell
    }

    // Function to prepere segue for Progress and Details View Controllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProgress"{
            let tableViewCell = sender as! UITableViewCell
            let index = tableView.indexPathForSelectedRow?.row
            let destination = segue.destination as? ProgressViewController
            let task:TaskObject = data[index!]
            destination?.taskIn = task
           
        } else if segue.identifier == "toDetails"{
            let tableViewCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: tableViewCell)!
            let destination = segue.destination as? DetailsViewController
            let task:TaskObject = data[indexPath.row]
            destination?.taskIn = task
        }
    }
 
    //Execute AddTask
    @IBAction func btnAddTaskClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toAddTask", sender: self)
    }
}
