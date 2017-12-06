//
//  mainViewController.swift
//  egco428.hiddenAssignment
//
//  Created by Pathompong Chaisri on 11/23/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class mainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
   
    @IBOutlet weak var tableView: UITableView!
    
    var userList = [User]()
    
    
    let cellReuseIdentifier = "cell"

    struct userInformation {
        var s_Username:String
        var s_Password:String
        var s_Latitude:Double
        var s_Longtitude:Double
    }
    
    
    
    var ref: DatabaseReference!
    
    var username_login:String!
    var password_login:String!
    var dismiss = true
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        ref = Database.database().reference()
        ref.child("users").observe(DataEventType.value, with: { (snapshot) in
            for child in snapshot.children {
                let childData = (child as! DataSnapshot).value as! NSDictionary
                let firebase1 = childData.value(forKey: "username") as! String
                let firebase2 = childData.value(forKey: "password") as! String
                let firebase3 = childData.value(forKey: "latitude") as! Double
                let firebase4 = childData.value(forKey: "longtitude") as! Double
                self.userList.append(User(user: firebase1, pass: firebase2, lat: firebase3, long: firebase4))
                
                
                
                print(self.userList.count)
                if (self.username_login == firebase1 && self.password_login == firebase2 )
                {
                    var user = userInformation( s_Username: firebase1 , s_Password: firebase2 , s_Latitude : firebase3 , s_Longtitude: firebase4)
                    print(user)
                    
                    
                    print("dismiss")
                    
                    //prevent this vc to dismissed
                    self.dismiss = false
                    
                }
   
                
            }
            
            self.tableView.reloadData()
            //if username pass not correct dismiss this vc
            if (self.dismiss == true ){
                self.navigationController?.popViewController(animated: true)}
            
        })
        

        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return userList.count

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                    cell.textLabel?.text = userList[indexPath.row].Username

        
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let destination = segue.destination as! MapViewController
            destination.userData = userList[indexPath.row]
        }
    }
    
    

    
    
    
    
    
}

