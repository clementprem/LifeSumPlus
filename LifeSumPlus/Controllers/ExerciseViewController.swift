//
//  ExerciseViewController.swift
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

import UIKit
import MDMCoreData

class ExerciseViewController: UITableViewController, MDMFetchedResultsTableDataSourceDelegate {
    
    var tableViewDatasource : MDMFetchedResultsTableDataSource?
    override func viewDidLoad() {
        setupCollectionDatasource()
    }
    
    func setupCollectionDatasource() {
        tableViewDatasource = MDMFetchedResultsTableDataSource(tableView: tableView, fetchedResultsController: fetchResultController)
        tableViewDatasource?.delegate = self
        tableViewDatasource?.reuseIdentifier = "exerciseCell"
        tableView.dataSource  = tableViewDatasource
    }
    
    lazy var fetchResultController : NSFetchedResultsController = {
        let fetchRequest = NSFetchRequest(entityName: "Exercise")
        fetchRequest.fetchBatchSize = 100;
        let sortDesc = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDesc]
        let frc = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext:  LSPCoreDataManager.sharedInstance().managedObjectContext ,
            sectionNameKeyPath: nil,
            cacheName: nil)
        return frc
    }()
    
    func dataSource(dataSource: MDMFetchedResultsTableDataSource!, configureCell cell: AnyObject!, withObject object: AnyObject!) {
        let cell:ExerciseTableViewCell = cell! as! ExerciseTableViewCell;
        let exercise:Exercise = object as! Exercise;
        cell.titleLabel.text = exercise.title;
        cell.calorieLabel.text = exercise.calories?.stringValue;
    }
    
    //TODO : As this is a required method in the delegate we need to add this here. I have add a bug to the lib :-|
    func dataSource(dataSource: MDMFetchedResultsTableDataSource!, deleteObject object: AnyObject!, atIndexPath indexPath: NSIndexPath!) {
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
}
