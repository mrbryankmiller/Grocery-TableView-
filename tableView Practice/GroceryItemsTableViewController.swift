//
//  GroceryItemsTableViewController.swift
//  tableView Practice
//
//  Created by Bryan  Miller on 8/3/16.
//  Copyright © 2016 Bryan  Miller. All rights reserved.
//

import UIKit

class GroceryItemsTableViewController: UITableViewController {
    
    
    //var groceryItem = ["Item1", "Item2", "Item3"]
    
    @IBOutlet var groceryItemTableView: UITableView!
    
    
    @IBAction func addGroceryItemButtonPressed(sender: UIBarButtonItem) {
        
        ///new way///
        
        let alertController: UIAlertController = UIAlertController(title: "Add Grocery Item", message: "", preferredStyle: .Alert)
        
        //Cancel Button
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //cancel code
        }
        alertController.addAction(cancelAction)
        
        
        
        let saveAction: UIAlertAction = UIAlertAction(title: "Save", style: .Default) { action -> Void in
            
            let textField = alertController.textFields![0]
            groceryItem.items.append(textField.text!)
            self.tableView.reloadData()
            
            
        }
        
        alertController.addAction(saveAction)
        
        
        //Add text field
        
        //        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
        //        textField.textColor = UIColor.blackColor()
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter an Item"
            //alertController.textFields
        }
        
        //Present the AlertController
        self.presentViewController(alertController, animated: true, completion: nil)
        
        

        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return groceryItem.items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("groceryItem1", forIndexPath: indexPath)

    
        cell.textLabel!.text = groceryItem.items [indexPath.row]
        return cell
        
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            groceryItem.items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
