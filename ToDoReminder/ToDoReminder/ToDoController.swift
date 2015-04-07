//
//  ToDoController.swift
//  ToDoReminder
//
//  Created by Mathieu Spegagne on 05/04/2015.
//  Copyright (c) 2015 Mathieu Spegagne. All rights reserved.
//

import UIKit
import CoreData

class ToDoController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var log = [ToDo]()
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchLog()
        
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "ToDo")
        
        // Create a sort descriptor object that sorts on the "title"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [ToDo] {
            log = fetchResults
        }
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "ToDo")
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return log.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let task = fetchedResultController.objectAtIndexPath(indexPath) as ToDo
        cell.textLabel?.text = task.title
        
        if task.history.boolValue{
            cell.accessoryType = .Checkmark
        }
            
        else{
            cell.accessoryType = .None
        }
        
        return cell
        
        
    }

    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            var tappedItem: ToDo = self.log[indexPath.row] as ToDo
            
            tappedItem.history = !tappedItem.history.boolValue
        
            tableView.reloadData()
            
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let managedObject:NSManagedObject = fetchedResultController.objectAtIndexPath(indexPath) as NSManagedObject
        managedObjectContext?.deleteObject(managedObject)
        managedObjectContext?.save(nil)
        
        // Refresh the table view to indicate that it's deleted
        self.fetchLog()
        
        // Tell the table view to animate out that row
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        

    }

}
