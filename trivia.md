# Making a trivia application

## Set up the application

First, we wrote some code to load a background onto the app. Recall the wall-frame-image analogy, where we are putting up a wall, then hanging a picture frame on it, then putting an image into the frame.

```swift

import UIKit

class ViewController: UIViewController {
    
    // Make an image view that you can modify from any function in this class
    var imageView:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let width:CGFloat = 320
        let height:CGFloat = 480
        
        // Make the wall, the frame, and the image for the frame
        var wall:UIView = UIView(frame: CGRectMake(0, 0, width, height))
        var frame:UIImageView = UIImageView(frame: CGRectMake(0, 0, width, height))
        var image:UIImage = UIImage(named: "billgates")
        
        // Put up the wall
        view.addSubview(wall)
        // Hang the frame on the wall
        wall.addSubview(frame)
        // Put the image into the frame
        frame.image = image
    }

    
    // Ignore this
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
```

## Add in a button

Then, inside the `viewDidLoad` function, after the code we created above, we generated and added a button.
```swift
var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
button.frame = CGRectMake(0, 0, 100, 50)
button.center = CGPointMake(160, 300)
button.setTitle("Start", forState: UIControlState.Normal)
wall.addSubview(button)
```

The button doesn't have to look so bland. You can style it by using `setBackgroundImage`, `setTitleColor`, and other functions for changing button styles.
```swift

```

## Hook the button to a function

Add a target to the button - the action `"buttonClicked:` is called a *selector*, and is used to refer to a function.
```swift
myButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
```

Then, we add in a function named `buttonClicked` to respond to the button clicks. Make sure you place this along with all the other functions in your view.
```swift
    func buttonClicked(sender:UIButton) {
        println("Something got clicked")
    }
```

## Add in the logic

Now you want to hook up the logic of your application. For example, you could make a global `correctAnswer` variable that gets set by one function and read by the click handling function.
```swift
 func getRandomImage() -> String {
        var rand = arc4random_uniform(4) + 1
        if rand == 1 {
            correctAnswer = 1
            return "zacefron.jpg"
        }
        if rand == 2 {
            correctAnswer = 2
            return "taylorswift.jpg"
        }
        if rand == 3 {
            correctAnswer = 3
            return "billgates.jpg"
        }
        if rand == 4 {
            correctAnswer = 4
            return "arnoldschwartzenegger.jpg"
        }
        return "zacefron.jpg"
    }
    
    func buttonClicked(sender:UIButton) {
        if sender.tag == correctAnswer {
            println("Correct!")
        }
        else {
            println("Bad!")
        }
        var newImage:UIImage = UIImage(named: getRandomImage())
        imageView.image = newImage
    }
```

