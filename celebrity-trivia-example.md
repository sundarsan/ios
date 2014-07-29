## Keshav's celebrity trivia game

My `ViewController`

```swift
//
//  ViewController.swift
//  CelebrityTrivia
//
//  Created by techlab on 7/28/14.
//  Copyright (c) 2014 techlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // make imageview a global variable
    var imageView:UIImageView = UIImageView()
    // Make the model
    var model:TriviaModel = TriviaModel()
    // Make the list of buttons and the correct button tag
    var buttons:[UIButton] = []
    var correctButton:Int = 0
    
    func initializeView() {
        // The size of the wall
        let width:CGFloat = 320
        let height:CGFloat = 480
        // Make a wall
        var view:UIView = UIView(frame: CGRectMake(0, 0, width, height))
        self.view.addSubview(view)
        
        // Make a frame
        imageView = UIImageView(frame: view.frame)
        // Hang it on the wall
        view.addSubview(imageView)
    }
    
    // Add all data to the model
    func initializeData() {
        model.addCelebrity("Zac Efron", image: "zacefron")
        model.addCelebrity("Bill Gates", image: "billgates")
        model.addCelebrity("Mark Zuckerberg", image: "markzuck")
        model.addCelebrity("Steve Jobs", image: "stevejobs")
    }
    
    func initializeButtons() {
        // Generating the list of buttons in my view
        for i in 0 ... 4 {
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.setTitle("Button \(i)", forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside )
            button.setBackgroundImage( UIImage(named: "button") , forState: UIControlState.Normal)
            button.tag = i
            
            button.frame = CGRectMake(0, 0, 150, 50)
            button.center = CGPointMake(160, 100 + i * 80)
            
            buttons += button            // Add the button onto the list
            self.view.addSubview(button) // Add the button to the view
        }
    }
    
    func newQuestion() {
        // Set all buttons to a random incorrect celebrity
        for i in 0 ... 4 {
            buttons[i].setTitle(model.getRandomIncorrectCelebrity(), forState: UIControlState.Normal)
        }
        // Pick a button to have the correct answer
        var correct = Int(arc4random_uniform(4))
        correctButton = correct
        buttons[correct].setTitle(model.getCorrectCelebrity(), forState: UIControlState.Normal)
        imageView.image = UIImage(named: model.getCorrectImage())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        initializeData()
        initializeButtons()
        newQuestion()
    }
    
    func buttonClicked(whoWasClicked:UIButton) {
        println("clicked \(whoWasClicked.tag)")
        if whoWasClicked.tag == correctButton {
            println("correct!")
            newQuestion()
        }
        else {
            println("bad!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


```

My `TriviaModel`:
```swift
import Foundation

class TriviaModel {
    var celebrityList:[String] = []
    var celebrityImageList:[String] = []
    
    var correctAnswer:Int = 0
    
    func addCelebrity(name:String, image:String) {
        celebrityList += name
        celebrityImageList += image
    }
    
    func getCelebrity(index:Int) -> String {
        return celebrityList[index]
    }
    
    func getCelebrityImage(index:Int) -> String {
        return celebrityImageList[index]
    }
    
    func getCorrectCelebrity() -> String {
        correctAnswer = Int(arc4random_uniform( UInt32(celebrityList.count) ) )
        return celebrityList[correctAnswer]
    }
    
    func getCorrectImage() -> String {
        return celebrityImageList[correctAnswer]
    }
    
    // Give back a random incorrect celebrity
    func getRandomIncorrectCelebrity() -> String {
        var random:Int = Int(arc4random_uniform( UInt32(celebrityList.count) ) )
        while random == correctAnswer {
            random = Int(arc4random_uniform( UInt32(celebrityList.count) ) )
        }
        // After I've generated a valid random number
        return celebrityList[random]
    }
}
```
