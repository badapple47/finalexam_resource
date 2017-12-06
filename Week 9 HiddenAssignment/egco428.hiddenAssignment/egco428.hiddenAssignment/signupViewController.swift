//
//  signupViewController.swift
//  egco428.hiddenAssignment
//
//  Created by Pathompong Chaisri on 11/23/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase




class signupViewController: UIViewController {
    
    struct userInformation {
        var s_Username:String!
        var s_Password:String!
        var s_Latitude:Double?
        var s_Longtitude:Double?
    }

    
         var ref: DatabaseReference!

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longtitude: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }


    @IBAction func addNewUser(_ sender: Any) {
        
        var user = userInformation( s_Username: userName.text! , s_Password: passWord.text! , s_Latitude : Double(latitude.text!) , s_Longtitude: Double(longtitude.text!) )
        
        print(user)
        
        
        
        
      
        
      
        
        ref = Database.database().reference()
        
//        self.ref.child("users").child("test").setValue(["username": "joeyinwza99"])
//
  

 
            let key = ref.child("users").childByAutoId().key

            let post = ["username": user.s_Username , "password": user.s_Password ,"latitude": user.s_Latitude , "longtitude": user.s_Longtitude ] as [String : Any]
        
            let childUpdates = ["/users/\(key)": post,
                                "/user-list/\(user.s_Username)/": key] as [String : Any]

//            let childUpdates = [
//                                "/users/\(index)/": post]
            ref.updateChildValues(childUpdates)

        
        
//        ref.child("users").child("1").observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as? String ?? ""
//
//            print(username)
//
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }

  ref.child("users").observe(DataEventType.value, with: { (snapshot) in
        //            let jsonData = snapshot.value as! NSDictionary
        //            let userKey = snapshot.key as! String
        for child in snapshot.children {
        let childData = (child as! DataSnapshot).value as! NSDictionary
        let username = childData.value(forKey: "username") as! String
        let password = childData.value(forKey: "password") as! String
//        let latitude = childData.value(forKey: "latitude") as! Double
//        let longtitude = childData.value(forKey: "longtitude") as! Double
  
           
        }

        })
   
        
        

        
        
    }
    
}
