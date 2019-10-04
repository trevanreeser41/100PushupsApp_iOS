//
//  MasterViewController.swift
//  Project 1 Pushups
//
//  Created by Student on 10/1/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class MasterViewController : UITableViewController {
    
    var model: [WorkoutEntry] = []
    var totalNumberOfPushups = 0
    
    private struct Storyboard {
        static let cellIdentifier = "PushupDate"
        static let segueIdentifier = "ShowSegue"
    }
    
    private struct Key {
        static let workout = "workout"
    }
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        //In this case, there is nothing to do but we need a target
    }
    
    @IBAction func exitAndSaveRecordScene(_ segue: UIStoryboardSegue) {
        if let AddWorkoutVC = segue.source as? AddWorkoutController {
            model.append(WorkoutEntry(date: AddWorkoutVC.date,
                                      numberOfPushups: AddWorkoutVC.numberOfPushups,
                                      setNum: AddWorkoutVC.setNum))
            tableView.reloadData()
        }
    }
    
    private func totalPushups() {
        for workout in model {
            totalNumberOfPushups = workout.numberOfPushups + totalNumberOfPushups
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        initializeModel()
        saveModel()
        loadModel()
        totalPushups()
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
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Storyboard.segueIdentifier, sender: indexPath)
    }
}

//MARK: - Table view data source

extension MasterViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.cellIdentifier,
                                                 for: indexPath)
        cell.textLabel?.text = "\(model[indexPath.row].date)"
        cell.detailTextLabel?.text = "\(model[indexPath.row].numberOfPushups)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Total Number of Pushups: \(totalNumberOfPushups)"
    }
}

//MARK: - Helpers

extension MasterViewController {
    private func initializeModel() {
        model.removeAll()
        
        model.append(WorkoutEntry(date: "October 3, 2019", numberOfPushups: 9, setNum: 1))
        model.append(WorkoutEntry(date: "October 2, 2019", numberOfPushups: 4, setNum: 1))
        model.append(WorkoutEntry(date: "October 1, 2019", numberOfPushups: 7, setNum: 1))
        model.append(WorkoutEntry(date: "September 30, 2019", numberOfPushups: 9, setNum: 1))
        model.append(WorkoutEntry(date: "September 27, 2019", numberOfPushups: 1, setNum: 1))
        model.append(WorkoutEntry(date: "September 26, 2019", numberOfPushups: 9, setNum: 1))
        model.append(WorkoutEntry(date: "September 23, 2019", numberOfPushups: 3, setNum: 1))
        model.append(WorkoutEntry(date: "September 21, 2019", numberOfPushups: 9, setNum: 1))
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
