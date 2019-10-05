//
//  AddWorkoutController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddWorkoutController : UITableViewController {
    
    //MARK: - Properties
    
    var date: String = ""
    var setNumber: Int = 0
    var numberOfPushups: Int = 0
    
    //MARK: - Constants
    
    private struct Key {
        static let workout = "workout"
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var addWorkoutDate: UIDatePicker!
    
    @IBOutlet weak var addPushupNumber: UITextField!
    
    @IBOutlet weak var addSetNumber: UITextField!
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

