//
//  ViewController.swift
//  Ex3_Gesture
//
//  Created by Pathompong Chaisri on 11/2/2560 BE.
//  Copyright © 2560 Pathompong Chaisri. All rights reserved.
//

import UIKit
import AVFoundation




class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    

    var audioPlayer : AVAudioPlayer?
    let mySound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "song", ofType: "mp3")! )
    let mySound2 = NSURL(fileURLWithPath: Bundle.main.path(forResource: "song2", ofType: "mp3")! )
    
    var Music : NSURL?
    
    var shakethingsup : Int = 0
    
    @IBOutlet weak var imageView: UIImageView!
    

    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(event?.subtype == UIEventSubtype.motionShake){
            print("SHAKE IT OFF")
           
            if (shakethingsup==0){
             Music = mySound
                shakethingsup = 1
                
                
         
                
            }else {
                 Music = mySound2
                shakethingsup = 0
            
            }
            
            do{
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            }catch _{
                
            }
            
            do{
                try AVAudioSession.sharedInstance().setActive(true)
            }catch _{
                
            }
            
            do{
                //เลือก Music จาก URL มาเล่น
                audioPlayer = try AVAudioPlayer(contentsOf: Music as! URL)
            }catch let error as NSError{
                print(error)
                audioPlayer = nil
            }
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = 0.5
            audioPlayer?.play()
            
            
        
            
          
        }
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
     
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

