//
//  MasterDetailViewController.swift
//  Week5_exercise
//
//  Created by Pathompong Chaisri on 9/21/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit

class MasterDetailViewControlle: UITableViewController {
    
    let food = ["Beef" , "Chicken" , "Fish" , "Pork"]
    let drink = ["Beer","Soda","Tea","Water"]
    
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return food.count
        }else{
            return drink.count
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = food[indexPath.row]
            //เอาไปใส่แต่ละ แถว
            cell.imageView?.image = UIImage(named : food[indexPath.row]+".jpg")
        //ใส่รูปไปใน cell
        case 1:
            cell.textLabel?.text = drink[indexPath.row]
            //เอาไปใส่แต่ละ แถว
            cell.imageView?.image = UIImage(named : drink[indexPath.row]+".jpg")
        default:
            break
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Food"
        }else{
            return "Drink"
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow{
            
            if indexPath.section == 0{
                let vfood = food[indexPath.row]
                (segue.destination as! ViewController).pname = vfood
            }else{
                let vdrink = drink[indexPath.row]
                (segue.destination as! ViewController).pname = vdrink
                
            }
          
           
        }
    }
    
}
