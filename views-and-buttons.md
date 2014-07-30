## Navigating between views with buttons

Here are some helpful utilities for working with many buttons across many views in a single view app.
```swift
    // List of current buttons in my app
    var currentButtons:[UIButton] = []
    
    // Adds a button to the view as well as the list storing buttons
    func addButtonToView(button:UIButton) {
        self.view.addSubview(button)
        currentButtons.append(button)
    }
    
    // Clears buttons out of the list and removes from the view
    func removeAllButtons() {
        for button in currentButtons {
            button.removeFromSuperview()
        }
    }
    
    // Create a UIButton
    func createButton(text:String, load:Selector, x:CGFloat, y:CGFloat) -> UIButton {
        var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        // Set title and attributes about the button
        button.setTitle(text, forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named: "black-button"), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: load, forControlEvents: UIControlEvents.TouchUpInside)
        // Set the button's frame and center point
        button.frame = CGRectMake(0, 0, 150, 60)
        button.center = CGPointMake(x, y)
        return button
    }
```

You can use them like this:
```swift
addButtonToView( createButton("characters", load: "loadCharacters:", x: 160, y: 50) )
```
