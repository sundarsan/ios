//
//  ViewController.swift
//  patterngame
//
//  Created by Keshav Saharia on 7/31/15.
//  Copyright (c) 2015 example. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pattern = ["red", "green", "red", "red", "blue", "yellow"]
    
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    
    @IBOutlet weak var blue: UIButton!
    
    @IBOutlet weak var yellow: UIButton!
    
    @IBOutlet weak var prompt: UILabel!
    // Challenge 1: verify that you are following the pattern
    // Hints:
    // - make an index to store where you are in the pattern
    // - keep increasing that index as the player gives correct taps
    // - reset the index when the player gives a wrong tap
    @IBAction func tapped(sender:UIButton) {
        if sender == red {
            // you tapped the red button
        }
        if sender == green {
            // ...
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button("red", on: false)
        button("green", on: false)
        button("blue", on: false)
        button("yellow", on: false)
        
        var time = 1.0
        for color in pattern {
            delay(time) {
                self.button(color, on: true)
            }
            delay(time + 0.4) {
                self.button(color, on: false)
            }
            time = time + 0.5
        }
        delay(time) {
            self.prompt.text = "Now you repeat it!"
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func button(button:String, on:Bool) {
        var a:CGFloat = 1
        if !on {
            a = 0.5
        }
        
        if button == "red" {
            red.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: a)
        }
        if button == "green" {
            green.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: a)
        }
        if button == "blue" {
            blue.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: a)
        }
        if button == "yellow" {
            yellow.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 0/255, alpha: a)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  // Delay function from StackOverflow
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
