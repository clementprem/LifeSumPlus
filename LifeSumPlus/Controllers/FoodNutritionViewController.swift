//
//  FoodNutritionViewController.swift
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

import UIKit

class FoodNutritionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var cellHeight = 0.0
    var dataSourceDict :NSDictionary?
    var foodName = ""
    
    override func viewDidLoad() {
        self.tableView.registerNib(UINib(nibName: "NutritionCell", bundle: nil), forCellReuseIdentifier :"nutritionCellIdentifier")
        titleLabel.text = foodName
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceDict!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : NutritionCell = self.tableView.dequeueReusableCellWithIdentifier("nutritionCellIdentifier") as! NutritionCell
        let title = dataSourceDict?.allKeys[indexPath.row] as! String
        cell.titleLabel.text = title
        let value =  dataSourceDict![title] as? NSNumber
        cell.valueLabel.text = value?.stringValue
        cell.selectionStyle = .None
        return cell;
    }
    
    @IBAction func dismissView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
