//
//  AddController.swift
//  ToDoReminder
//
//  Created by Mathieu Spegagne on 05/04/2015.
//  Copyright (c) 2015 Mathieu Spegagne. All rights reserved.
//

import UIKit
import CoreData

class AddController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveListener(sender: AnyObject) {
        if let moc = self.managedObjectContext {
            let task = ToDo.save(moc, newTitle: titleField.text, newText: textField.text)
            let alertController = task.alert()
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

}
