//
//  WorkoutEntry.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

struct WorkoutEntry {
    var date: String
    var numberOfPushups: Int
    var setNum: Int

    var propertyList: [Any] {
        return [date, numberOfPushups, setNum]
    }
    
    init(date: String, numberOfPushups: Int, setNum: Int) {
        self.date = date
        self.numberOfPushups = numberOfPushups
        self.setNum = setNum
    }
    
    init?(propertyList: [Any]) {
        if propertyList.count != 3 {
            return nil
        }
        
        guard let date = propertyList[0] as? String,
              let numberOfPushups = propertyList[1] as? Int,
              let setNum = propertyList[2] as? Int else {
            return nil
        }

        self.date = date
        self.numberOfPushups = numberOfPushups
        self.setNum = setNum
    }
}


