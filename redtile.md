//
//  ViewController.swift
//  redtile
//
//  Created by Keshav Saharia on 5/16/15.
//  Copyright (c) 2015 Evil Apps, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var grid:[[UIButton]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for row in 0 ... 5 {
            var buttonRow:[UIButton] = []
            for column in 0 ... 5 {
                var button = createButton(false, x: CGFloat(40 + row * 60), y: CGFloat(80 + column * 60))
                buttonRow.append(button)
                self.view.addSubview(button)
            }
            grid.append(buttonRow)
        }
        
    }
    
    func createButton(active:Bool, x:CGFloat, y:CGFloat) -> UIButton {
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = CGRectMake(0, 0, 50, 50)
        button.center = CGPointMake(x, y)
        button.backgroundColor = UIColor.redColor()
        button.tag = 0
        
        if active {
            button.tag = 1
        }
        
        // Optional appearance-related things
        button.addTarget(self, action: "clicked:", forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    func clicked(sender:UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            sender.backgroundColor = UIColor.greenColor()
        }
        else {
            sender.tag = 0
            sender.backgroundColor = UIColor.redColor()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

