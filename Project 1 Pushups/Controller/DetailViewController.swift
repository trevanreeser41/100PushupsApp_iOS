//
//  DetailViewController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    var date = String()
    var numberOfPushups = 0
    var setNum = 0
    var currentWorkoutIndex = 0
    var model: [WorkoutEntry] = []
    var entry: String?
    
    private struct Key {
        static let currentWorkoutIndex = "currentWorkoutIndex"
        static let entry = "entry"
    }
    
    @IBOutlet weak var currentWorkout: UILabel!
    
    @IBOutlet weak var pushupCount: UILabel!
    
    @IBOutlet weak var setNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        currentWorkout.text = date
        pushupCount.text = "\(numberOfPushups)"
        setNumber.text = "\(setNum)"
    }
    
    //MARK: - State restoration
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        currentWorkoutIndex = coder.decodeInteger(forKey: Key.currentWorkoutIndex)
        
        if let savedEntry = coder.decodeObject(forKey: Key.entry) as? String {
            entry = savedEntry
        } else {
            entry = nil
        }
        
        //configure(updatingCurrentIndex: false)
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        coder.encode(currentWorkoutIndex, forKey: Key.currentWorkoutIndex)
        coder.encode(entry, forKey: Key.entry)
    }

}
