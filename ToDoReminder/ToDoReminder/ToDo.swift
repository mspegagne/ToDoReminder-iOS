//
//  ToDo.swift
//  ToDoReminder
//
//  Created by Mathieu Spegagne on 02/04/2015.
//  Copyright (c) 2015 Mathieu Spegagne. All rights reserved.
//

import Foundation
import UIKit

class ToDo {
    
    var Text:String
    var Title:String
    
    init(newText:String, newTitle:String){
        self.Text = newText
        self.Title = newTitle
    }
    
    func alert()->UIAlertController {
        let alertController = UIAlertController(title: self.Title, message: self.Text, preferredStyle: UIAlertControllerStyle.Alert)
    
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
    
        return alertController
    }
    
}