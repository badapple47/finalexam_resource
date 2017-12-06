//
//  ViewController.swift
//  finalexam
//
//  Created by Pathompong Chaisri on 12/7/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
 
    //ระวังเรื่อง cell indentify
     //ระวังเรื่อง cell indentify
     //ระวังเรื่อง cell indentify //ระวังเรื่อง cell indentify //ระวังเรื่อง cell indentify
     //ระวังเรื่อง cell indentify
     //ระวังเรื่อง cell indentify
     //ระวังเรื่อง cell indentify
    
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var tableView: UITableView!
    
    let food = ["Beef" , "Chicken" , "Fish" , "Pork"]
    let drink = ["Beer","Soda","Tea","Water"]
    
        let cellReuseIdentifier = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.reloadData()
        
        ref = Database.database().reference()
        
        let key = ref.child("users").childByAutoId().key
        
        let post = ["username": "joeyinwza" , "password": "naja" ] as [String : Any]
        
        let childUpdates = ["/users/\(key)": post,
                            "/user-list/\(post["username"])/": key] as [String : Any]
        
         ref.updateChildValues(childUpdates)
        
        print("created data to database")
        
        
        //read from firebase
        
        print("accessing firebase database")
        ref.child("users").observe(DataEventType.value, with: { (snapshot) in
            //            let jsonData = snapshot.value as! NSDictionary
            //            let userKey = snapshot.key as! String
            for child in snapshot.children {
                let childData = (child as! DataSnapshot).value as! NSDictionary
                let username = childData.value(forKey: "username") as! String
                let password = childData.value(forKey: "password") as! String
                print(username+password)
            }
            
        })

    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(event?.subtype == UIEventSubtype.motionShake){
            print("let the earth shake")
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = food[indexPath.row]
        
        
        
        return cell
    }
    



}

