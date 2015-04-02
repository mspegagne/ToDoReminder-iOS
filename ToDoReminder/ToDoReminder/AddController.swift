//
//  ViewController.swift
//  ToDoReminder
//
//  Created by Mathieu Spegagne on 24/03/2015.
//  Copyright (c) 2015 Mathieu Spegagne. All rights reserved.
//

import UIKit


class AddController: UIViewController {
    
    @IBOutlet weak var TitleField: UITextField!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var SaveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TitleListener(sender: AnyObject) {
    }
    @IBAction func TextListener(sender: AnyObject) {
    }
    @IBAction func SaveListener(sender: AnyObject) {
        var essai = ToDo(newText:TitleField.text, newTitle:TextField.text)
        var alertController = essai.alert()
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
