//
//  GroceryListTableViewController.swift
//  tableView Practice
//
//  Created by Bryan  Miller on 8/2/16.
//  Copyright © 2016 Bryan  Miller. All rights reserved.
//

import UIKit

class GroceryListTableViewController: UITableViewController {
    
    
      var groceryList  = ["Breakfast","Lunch", "Dinner"]
    
    @IBOutlet var myTableView: UITableView!
    
    @IBAction func addButton(sender: UIBarButtonItem) {
        
//
//        
//        //needed to reload the data///
//        self.tableView.reloadData()
        
        ////old way///
        
//        let alert = UIAlertView()
//        alert.title = "Add Grocery Catergory"
//        alert.addButtonWithTitle("Save")
//        print("save")
//        alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
//        alert.addButtonWithTitle("Cancel")
//        alert.show()
//        
//        var textField = alert.textFieldAtIndex(0)
//        textField!.placeholder = "Enter an Item"
//        print (textField!.text)
//        self.tableView.reloadData()
        
        
        ///new way///
        
        let alertController: UIAlertController = UIAlertController(title: "Add Grocery Category", message: "", preferredStyle: .Alert)
        
        //Cancel Button
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //cancel code
        }
        alertController.addAction(cancelAction)
            
    
            
        let saveAction: UIAlertAction = UIAlertAction(title: "Save", style: .Default) { action -> Void in
         
            let textField = alertController.textFields![0] 
            self.groceryList.append(textField.text!)
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
        
        //edit button
        
    self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
       return groceryList.count
    }

     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("prototype1", forIndexPath: indexPath) as UITableViewCell


         cell.textLabel!.text = groceryList [indexPath.row]
    
        
        
        return cell
        
        
    }
    
    // pass a tableview cell value to navigationBar title in swift//
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as UIViewController
        let cell = sender as! UITableViewCell
        destinationVC.navigationItem.title = cell.textLabel?.text
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            groceryList.removeAtIndex(indexPath.row)
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
