//
//  AddWorkoutController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddWorkoutController : UITableViewController {
    var date = ""
    var numberOfPushups = 0
    var setNumber = 0
    
    @IBOutlet weak var addWorkoutDate: UIDatePicker!
    
    @IBOutlet weak var addPushupNumber: UITextField!
    
    @IBOutlet weak var addSetNumber: UITextField!
}
