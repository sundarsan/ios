```swift
//
//  ViewController.swift
//  StarWarsPedia
//
//  Created by techlab on 8/6/14.
//  Copyright (c) 2014 Keshav's Evil App Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Make the variables of your app.
    let width:CGFloat = 320
    let height:CGFloat = 480
    
    // Make the views and other components that need to be shared.
    var splashView:UIView!
    var homeView:UIView!
    var characterView:UIView!
    
    // Where everything starts.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create every view
        createSplashView()
        createHomeView()
        // Only add the first view to the visible view
        view.addSubview(splashView)
    }
    
    // Group of instructions that creates the splash view
    func createSplashView() {
        // Make the wall, frame, and picture
        splashView = UIView(frame: CGRectMake(0, 0, width, height))
        var splashImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, width, height))
        var splashImage:UIImage = UIImage(named: "splash-background")
        
        // Put the frame on the wall
        splashView.addSubview(splashImageView)
        // Put the picture in the frame
        splashImageView.image = splashImage
        
        // Make a button and hook it into another function
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        // Position the button
        button.frame = CGRectMake(0, 0, 100, 50)
        button.center = CGPointMake(160, 300)
        // Style and text of the button
        button.setTitle("Start", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "button-background"), forState: UIControlState.Normal)
        // Add a function to run when the button is clicked
        button.addTarget(self, action: "splashButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        // Put the button on the wall
        splashView.addSubview(button)
    }
    
    func splashButtonClicked(sender:UIButton) {
        // Tell the splash view to go away
        splashView.removeFromSuperview()
        // Create the home view and add it to the view
        createHomeView()
        view.addSubview(homeView)
    }
    
    func createHomeView() {
        // Make the wall, frame, and picture
        homeView = UIView(frame: CGRectMake(0, 0, width, height))
        var homeImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, width, height))
        var homeImage:UIImage = UIImage(named: "home-background")
        
        // Put the frame on the wall
        splashView.addSubview(homeImageView)
        // Put the picture in the frame
        homeImageView.image = homeImage
        
        var buttonNames = ["Characters", "Vehicles", "Planets", "Jedi"]
        var buttonY:CGFloat = 100
        var buttonTag:Int = 1
        
        // For every button name in my list of button names
        for buttonName in buttonNames {
            // Make a button and hook it into another function
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            // Position the button
            button.frame = CGRectMake(0, 0, 100, 50)
            
            // The stuff that changes every time for the buttons (position and tag)
            button.center = CGPointMake(160, buttonY)
            buttonY = buttonY + 100
            button.tag = buttonTag
            buttonTag = buttonTag + 1
            
            // Style and text of the button
            button.setTitle(buttonName, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.setBackgroundImage(UIImage(named: "button-background"), forState: UIControlState.Normal)
            // Add a function to run when the button is clicked
            button.addTarget(self, action: "categoryButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            
            // Put the button on the wall
            homeView.addSubview(button)
        }
    }
    
    func categoryButtonClicked(sender:UIButton) {
        homeView.removeFromSuperview()
        if sender.tag == 1 {
            createCharacterView()
            view.addSubview(characterView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


```
