//
//  DetailViewController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/3/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    
    //MARK: - Properties
    
    var date = "10/01/19"
    var numberOfPushups = 7
    var setNum = 1
    var pageIndex = 0
    
    //MARK: - Constants
    
    private struct Key {
        static let pageIndex = "pageIndex"
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var currentWorkout: UILabel!
    
    @IBOutlet weak var pushupCount: UILabel!
    
    @IBOutlet weak var setNumber: UILabel!
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    //MARK: - Helpers
    
    private func updateUI() {
        currentWorkout.text = date
        pushupCount.text = "\(numberOfPushups)"
        setNumber.text = "\(setNum)"
    }
    
    //MARK: - State restoration
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        pageIndex = coder.decodeInteger(forKey: Key.pageIndex)

    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        coder.encode(pageIndex, forKey: Key.pageIndex)
    }
}
