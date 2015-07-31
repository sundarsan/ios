//
//  A game where you repeat a pattern.
//
//  Created by Keshav Saharia on 7/31/15.

import UIKit

class ViewController: UIViewController {

    var pattern:[String] = []
    var patternIndex = 0
    var buttonsEnabled = false
    
    // The buttons for the pattern
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var blue: UIButton!
    @IBOutlet weak var yellow: UIButton!
    
    // For prompting the user
    @IBOutlet weak var prompt: UILabel!
    
    // When any button is tapped
    @IBAction func tapped(sender:UIButton) {
        if buttonsEnabled {
            if sender == red && pattern[patternIndex] == "red" {
                button("red", on: true)
                delay(0.2) {
                    self.button("red", on: false)
                }
                patternIndex++
            }
            else if sender == green && pattern[patternIndex] == "green" {
                button("green", on: true)
                delay(0.2) {
                    self.button("green", on: false)
                }
                patternIndex++
            }
            else if sender == blue && pattern[patternIndex] == "blue" {
                button("blue", on: true)
                delay(0.2) {
                    self.button("blue", on: false)
                }
                patternIndex++
            }
            else if sender == yellow  && pattern[patternIndex] == "yellow" {
                button("yellow", on: true)
                delay(0.2) {
                    self.button("yellow", on: false)
                }
                patternIndex++
            }
            else {
                prompt.text = "Wrong! Should have been " + pattern[patternIndex]
                patternIndex = 0
            }
            
            if patternIndex >= pattern.count {
                patternIndex = 0
                prompt.text = "Great, you got it right!"
                
                delay(1.0) {
                    self.increasePattern()
                    self.showPattern()
                }
            }
        }
    }
    
    func showPattern() {
        // Prompt the user to watch the pattern and disable button input
        prompt.text = "Watch the pattern!"
        buttonsEnabled = false
        
        // Turn off all buttons
        button("red", on: false)
        button("green", on: false)
        button("blue", on: false)
        button("yellow", on: false)
        
        // Set delays for turning buttons on and off
        var time = 1.0
        for color in pattern {
            // After the given amount of time, turn on the button
            delay(time) {
                self.button(color, on: true)
            }
            // After 0.4 seconds, turn it off
            delay(time + 0.4) {
                self.button(color, on: false)
            }
            // Turn on the next button after 0.5 seconds 
            // (so there is a 0.1 second gap between buttons)
            time = time + 0.5
        }
        // After the pattern was displayed, prompt the user and enable button input
        delay(time) {
            self.prompt.text = "Now you repeat it!"
            self.buttonsEnabled = true
        }
    }
    
    // Add a random color to the pattern
    func increasePattern() {
        var random = Int(arc4random_uniform(4))
        if random == 0 {
            pattern.append("red")
        }
        if random == 1 {
            pattern.append("green")
        }
        if random == 2 {
            pattern.append("blue")
        }
        if random == 3 {
            pattern.append("yellow")
        }
    }
    
    // Show the first pattern
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a random color to the pattern array
        increasePattern()
        
        // Show the current pattern
        showPattern()
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

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}

