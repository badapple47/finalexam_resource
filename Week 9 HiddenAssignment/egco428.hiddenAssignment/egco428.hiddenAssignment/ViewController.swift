//
//  ViewController.swift
//  egco428.hiddenAssignment
//
//  Created by Pathompong Chaisri on 11/23/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    @IBOutlet weak var username_tf: UITextField!
    @IBOutlet weak var password_tf: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  if (segue.identifier == "vctoMain") {
            let vc = segue.destination as! mainViewController
        vc.username_login = username_tf.text
        vc.password_login = password_tf.text

  }
//  else if segue.identifier == "vctoSignUp"{
//    
//        }
    }


}

