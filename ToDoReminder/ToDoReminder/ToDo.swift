//
//  ToDo.swift
//  ToDoReminder
//
//  Created by Mathieu Spegagne on 05/04/2015.
//  Copyright (c) 2015 Mathieu Spegagne. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(ToDo)
class ToDo: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var text: String
    @NSManaged var history: NSNumber
    
    func alert()->UIAlertController {
        let alertController = UIAlertController(title: self.title, message: self.text, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
        
        return alertController
    }
    
    class func save(moc: NSManagedObjectContext, newTitle: String, newText: String) -> ToDo {
        
        let entityDescripition = NSEntityDescription.entityForName("ToDo", inManagedObjectContext: moc)
        let task = ToDo(entity: entityDescripition!, insertIntoManagedObjectContext: moc)
        task.title = newTitle
        task.text = newText
        task.history = false
        moc.save(nil)
        return task
        
    }

}
