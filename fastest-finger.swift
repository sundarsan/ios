//
//  ViewController.swift
//  fastestfinger
//
//  Created by Keshav Saharia on 7/23/15.
//  Copyright (c) 2015 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // The button that controls everything
    @IBOutlet var button:UIButton!
    
    // Firebase to read from and write to
    var firebase:Firebase = Firebase(url: "https://fastfingers.firebaseio.com")
    
    // Things that our ithing will store
    var state = 1
    var start:NSTimeInterval!
    
    // Whenever you click the button, transition between states
    @IBAction func clicked() {
        // Change the state
        if state == 2 {
            stopTimer()
            state = 3
        }
        else if state == 4 {
            state = 5
        }
        else if state == 5 {
            startRound()
            state = 1
        }
        
        doState()
    }
    
    func startRound() {
        firebase.childByAppendingPath("start").setValue(true)
        firebase.childByAppendingPath("start").removeValue()
        firebase.childByAppendingPath("moderator").removeValue()
        delay(5.0) {
            self.firebase.observeSingleEventOfType(.Value, withBlock: { snapshot in
                // iterate all the elements :)
                var children = snapshot.children
                var won = "keshav"
                var best = 10.0
                
                while let child = children.nextObject() as? FDataSnapshot {
                    if let time = child.value as? Double {
                        if (time < best) {
                            won = child.key
                        }
                    }
                }
                
                self.firebase.childByAppendingPath("winner").setValue(won)
            })
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    // Do the action for the state that the game is currently in.
    func doState() {
        if state == 1 {
            button.setTitle("Wait for it...", forState:UIControlState.Normal)
            button.backgroundColor = UIColor.redColor()
        }
        if state == 2 {
            button.setTitle("Press the button!", forState:UIControlState.Normal)
            button.backgroundColor = UIColor.greenColor()
        }
        if state == 3 {
            button.setTitle("Waiting for everyone else...", forState:UIControlState.Normal)
            button.backgroundColor = UIColor.blueColor()
        }
        if state == 4 {
            button.setTitle("Winner is keshav!", forState:UIControlState.Normal)
            button.backgroundColor = UIColor.blueColor()
        }
        if state == 5 {
            button.setTitle("Start the round!", forState:UIControlState.Normal)
            button.backgroundColor = UIColor.blueColor()
        }
    }
    
    func startTimer() {
        start = NSDate.timeIntervalSinceReferenceDate()
    }
    
    func stopTimer() {
        firebase.childByAppendingPath("keshav").setValue(NSDate.timeIntervalSinceReferenceDate() - start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase.childByAppendingPath("moderator").observeEventType(.Value, withBlock: { snapshot in
            // If I can make the name variable equal to the moderator value
            if let name = snapshot.value as? String {
                // If the moderator is me
                if name == "keshav" {
                    self.state = 5
                    self.firebase.childByAppendingPath("start").setValue(false)
                    self.doState()
                }
            }
        })
        
        firebase.childByAppendingPath("winner").observeEventType(.Value, withBlock: { snapshot in
            // If I can make the name variable equal to the moderator value
            if let name = snapshot.value as? String {
                // If the moderator is me
                if name == "" {
                    self.state = 1
                    self.doState()
                }
                if name == "keshav" {
                    self.state = 4
                    self.firebase.childByAppendingPath("start").setValue(false)
                    self.firebase.childByAppendingPath("moderator").setValue("keshav")
                    self.firebase.childByAppendingPath("winner").setValue("")
                    self.doState()
                }
            }
        })
        
        firebase.childByAppendingPath("start").observeEventType(.Value, withBlock: { snapshot in
            // If I can make the name variable equal to the moderator value
            if let start = snapshot.value as? Bool {
                // If the moderator is me
                if start == true {
                    self.state = 2
                    self.startTimer()
                    self.doState()
                }
            }
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

