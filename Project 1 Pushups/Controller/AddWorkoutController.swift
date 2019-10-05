//
//  AddWorkoutController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddWorkoutController : UITableViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var addWorkoutDate: UIDatePicker!
    
    @IBOutlet weak var addPushupNumber: UITextField!
    
    @IBOutlet weak var addSetNumber: UITextField!
    
    //MARK: - View Controller Lifecycle
        
    var date: String = ""
    var setNumber: Int = 0
    var numberOfPushups: Int = 0
    
    var model: [WorkoutEntry] = []
    
    private struct Key {
        static let workout = "workout"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

