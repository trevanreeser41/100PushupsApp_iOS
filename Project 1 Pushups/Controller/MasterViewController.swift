//
//  MasterViewController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class MasterViewController : UITableViewController {
    
    //MARK: - Properties
    
    var model: [WorkoutEntry] = []
    var totalNumberOfPushups = 0
    
    //MARK: - Constants
    
    private struct Storyboard {
        static let cellIdentifier = "PushupDate"
        static let segueIdentifier = "ShowSegue"
    }
    
    private struct Key {
        static let workout = "workout"
    }
    
    //MARK: - Segues
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        //In this case, there is nothing to do but we need a target
    }
    
    @IBAction func exitAndSaveRecordScene(_ segue: UIStoryboardSegue){
        //This will save the workout data in the Add view and place it into the home table
        if let addWorkoutVC = segue.source as? AddWorkoutController{
                addWorkoutVC.date = "\(addWorkoutVC.addWorkoutDate.date)"
            
                let formatter = NumberFormatter()
                //Format the date to display nicely as mm/dd/yyyy
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "MM/dd/YYYY"
                addWorkoutVC.date = dateformatter.string(from: addWorkoutVC.addWorkoutDate.date)
            
            //convert string inputs to int
            if let stringPushups = addWorkoutVC.addPushupNumber.text {
                    if let nsIntPushups = formatter.number(from: stringPushups) as? Int {
                        addWorkoutVC.numberOfPushups = nsIntPushups
                    }
                }
            
            if let stringSet = addWorkoutVC.addSetNumber.text {
                    if let nsIntSet = formatter.number(from: stringSet) as? Int {
                        addWorkoutVC.setNumber = nsIntSet
                    }
                }
            
            model.append(WorkoutEntry(date: addWorkoutVC.date, numberOfPushups: addWorkoutVC.numberOfPushups, setNum: addWorkoutVC.setNumber))
            
            tableView.reloadData()
            //sum new total pushups after adding data
            totalPushups()
        }
    }
    
    //MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeModel()
        loadModel()
        saveModel()
        totalPushups()
    }
    
    //MARK: - Helpers
    
    //sum and display the total number of pushups
    private func totalPushups() {
        totalNumberOfPushups = 0
        
        for workout in model {
            totalNumberOfPushups = workout.numberOfPushups + totalNumberOfPushups
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController {
            if let detailVC = navVC.topViewController as? DetailViewController {
                if let indexPath = sender as? IndexPath {
                    detailVC.date = model[indexPath.row].date
                    detailVC.numberOfPushups = model[indexPath.row].numberOfPushups
                    detailVC.setNum = model[indexPath.row].setNum
                }
            }
        }
    }
}

//MARK: - Table view delegate

extension MasterViewController {
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.segueIdentifier,
                     sender: indexPath)
    }
}

//MARK: - Table view data source

extension MasterViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int{
        return model.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cellIdentifier,
                                                 for: indexPath)
        
        cell.textLabel?.text = "\(model[indexPath.row].date)"
        cell.detailTextLabel?.text = "\(model[indexPath.row].numberOfPushups)"
        
        return cell
    }
    //Header displaying total number of pushups
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Total Number of Pushups: \(totalNumberOfPushups)"
    }
}

//MARK: - Model Management

extension MasterViewController {
    private func initializeModel() {
        
        model.append(WorkoutEntry(date: "09/29/2019", numberOfPushups: 9, setNum: 1))
        model.append(WorkoutEntry(date: "09/30/2019", numberOfPushups: 4, setNum: 1))
        model.append(WorkoutEntry(date: "10/1/2019", numberOfPushups: 7, setNum: 1))
    }
    
    private func loadModel() {
        if let storedModel = UserDefaults.standard.array(forKey: Key.workout) as? [[Any]] {
            model.removeAll()
            
            for propertyListWorkout in storedModel {
                if let workout = WorkoutEntry(propertyList: propertyListWorkout) {
                    model.append(workout)
                }
            }
        }
    }
    
    private func saveModel() {
        let propertyListModel = model.map{ $0.propertyList }
        UserDefaults.standard.set(propertyListModel, forKey: Key.workout)
    }
}
