## Making a trivia application

First, we wrote some code to load in the images we got from the web.

```swift

import UIKit

class ViewController: UIViewController {
    
    // Make an image view that you can modify from any function in this class
    var imageView:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Make constants to describe size of view
        let width:CGFloat = 360
        let height:CGFloat = 480
        // Make a view and add it to the main view
        var newView:UIView = UIView(frame: CGRectMake(0, 0, width, height));
        self.view.addSubview(newView)
        
        // Make an image and add it to the imageView which was added to the
        // view I created above
        var newImage:UIImage = UIImage(named: "zacefron.jpg")
        imageView = UIImageView(frame: newView.frame)
        imageView.image = newImage
        
        // Adding the image view to the new view I created
        newView.addSubview(imageView)
    }

    
    // Ignore this
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


```


Then, at the bottom of the `viewDidLoad` function, we created and added a button.
```swift
var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
button.frame = CGRectMake(0, 0, 200, 50)
button.center = CGPointMake(180, 100)
button.setTitle("Zac Efron", forState: UIControlState.Normal)
newView.addSubview(button)
        
```

Hook up the button:
```swift
myButton.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
myButton.tag = 1
```

Maybe change the color:
```swift
myButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
```

Make a function to respond to button clicks:
```swift
    func buttonClicked(sender:UIButton) {
        println("Something got clicked")
        if sender.tag == 1 {
            println("Zac efron")
            var newImage:UIImage = UIImage(named: "taylorswift.jpg")
            imageView.image = newImage
        }
        if sender.tag == 2 {
            println("Taylor Swift")
            var newImage:UIImage = UIImage(named: "taylorswift.jpg")
            imageView.image = newImage
        }
    }

```


