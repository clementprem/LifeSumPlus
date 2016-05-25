//
//  CategoryViewController.swift
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

import MDMCoreData

class CategoryViewController: UITableViewController, MDMFetchedResultsTableDataSourceDelegate{

    var tableViewDatasource : MDMFetchedResultsTableDataSource?
    
    override func viewDidLoad() {
        setupCollectionDatasource()
        self.navigationItem.title = "Category"
    }
    
    func setupCollectionDatasource() {
        tableViewDatasource = MDMFetchedResultsTableDataSource(tableView: tableView, fetchedResultsController: fetchResultController)
        tableViewDatasource?.delegate = self
        tableViewDatasource?.reuseIdentifier = "categoryCell"
        tableView.dataSource  = tableViewDatasource
    }
    
    lazy var fetchResultController : NSFetchedResultsController = {
        let sortDesc = NSSortDescriptor(key: "category", ascending: true)
        return LSPCoreDataManager.sharedInstance().fetchResultControllerBuileder(
            "Category", pridicate: nil, sortDescriptor: sortDesc)
    }()
    
    func dataSource(dataSource: MDMFetchedResultsTableDataSource!, configureCell cell: AnyObject!, withObject object: AnyObject!) {
        let cell:UITableViewCell = cell! as! UITableViewCell;
        let category : FoodCategory = object as! FoodCategory;
        configTextLabel(cell.textLabel!, text: category.category!)
    }
    
    func configTextLabel(label:UILabel, text:String) {
        label.font = UIFont(name: "HelveticaNeue-Light", size: 18);
        label.textColor = UIColor.whiteColor();
        label.text = text;
    }
    
    func dataSource(dataSource: MDMFetchedResultsTableDataSource!, deleteObject object: AnyObject!, atIndexPath indexPath: NSIndexPath!) {
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showFoodsForIdSegue", sender: self);
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFoodsForIdSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let category = fetchResultController.objectAtIndexPath(indexPath)
                let oid = Double(category.oID!!)
                let predicate = NSPredicate(format: "categoryId == \(oid)", argumentArray: nil)
                let foodVc = segue.destinationViewController as! LSPFoodsListViewController
                foodVc.predicate = predicate
                foodVc.titleText = category.category;
                tableView.deselectRowAtIndexPath(indexPath, animated: false)
            }
        }
    }
}
