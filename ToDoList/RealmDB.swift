//
//  RealmDB.swift
//  Created by Elena Melnikova on 2018-12-04.
//  ToDoList
//  Student ID: 301025880
//  Description: Realm implements storage solution, contains methods that allow CRUD operations in internal DB. Object in internal DB contains Task ID, Task Name, TaskProgress and Complittion Status.
//  Copyright © 2018 Centennial College. All rights reserved.

import Foundation
import RealmSwift

// Internal DB object
class TaskObject : Object {
    @objc dynamic var itemID = UUID().uuidString
    @objc dynamic var taskName = ""
    @objc dynamic var taskNotes = ""
    @objc dynamic var taskProgress = 0
    @objc dynamic var isComplete = false
    
    override static func primaryKey() -> String? {
        return "itemID"
    }
    
    //Setter
    func setTaskObject(itemID: String, taskName: String, taskNotes: String, taskProgress: Int, isComplite: Bool) {

        self.itemID = itemID
        self.taskName = taskName
        self.taskNotes = taskNotes
        self.taskProgress = taskProgress
        self.isComplete = isComplite
    }
    
    //Setter
    public func setTaskObject(name taskName: String,
                     notes taskNotes: String) {
        self.taskName = taskName
        self.taskNotes = taskNotes
        self.taskProgress = 0
        self.isComplete = false
    }
}

//Internal DB
class RealmDB {
    
    private var db: Realm
    static let realmMgr = RealmDB()
    private init() {
        db = try! Realm()
    }
    
    // Read all items from DB
    func readAllDataDB() -> [TaskObject]? {
        let results = db.objects(TaskObject.self).toArray(ofType: TaskObject.self) as [TaskObject]
        return results.count > 0 ? results : nil
    }
    
    // Read item by itemID
    func readItemDB(_ itemId: String) -> TaskObject? {
        let item = db.object(ofType: TaskObject.self, forPrimaryKey: itemId)
        return item
    }
    
    // Create or update item
    func createOrUpdateItemDB(_ item: TaskObject) -> TaskObject? {
        // Update `TaskObject` if it already exists, add it if not.
        try! db.write {
            db.add(item, update: true)
        }
        return item
    }
    
    // Delete item by itemID
    func deleteItemDB(_ itemID: String) -> Bool {
        var retVal = false
        if let item = readItemDB(itemID)
        {
            try! db.write {
                db.delete(item)
                retVal = true
            }
        }
        return retVal
    }
    
    // Count items in DB
    func countDB() -> Int {
        let count = db.objects(TaskObject.self).count
        return count
    }
}

// Extention to convert results to array
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}

