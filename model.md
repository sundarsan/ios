## Hooking in a model to your view

Make a model class:
```swift

class TriviaModel {
    // what data do we need to store
    var score:Int = 0
    var currentCelebrity:String = "Zac Efron"
    var celebrities:[String] = []
    var images:[String] = []
    
    init() {
        self.addCelebrity("Zac Efron", image: "zacefron.jpg")
        self.addCelebrity("Bill Gates", image: "billgates.jpg")
        self.addCelebrity("Taylor Swift", image: "taylorswift.jpg")
    }
    
    // Give back the current score
    func getScore() -> Int {
        return score
    }
    
    func addCelebrity(celebrity:String, image: String) {
        celebrities += celebrity
        images += image
    }
    
    func getRandomCelebrity() -> String {
        var random:Int = Int(arc4random_uniform(UInt32(celebrities.count)))
        currentCelebrity = celebrities[random]
        return celebrities[random]
    }
    
    func getRandomCelebrityName() -> String {
        var random:Int = Int(arc4random_uniform(UInt32(celebrities.count)))
        return celebrities[random]
    }
    
    func getImageForCelebrity(celebrity:String) -> String {
        for index in 0 ... celebrities.count {
            if celebrities[index] == celebrity {
                return images[index]
            }
        }
        // Always make sure you are returning something
        return ""
    }
    
    func guess(celebrity: String) -> Bool {
        return false
    }
}
```

Hook in the model class to your view:
```swift
var model:TriviaModel = TriviaModel()
```

Use the model (here are some examples)
```swift
var newImage:UIImage = UIImage(named: model.getImageForCelebrity(model.getRandomCelebrity()))
```

```swift
       for celebrity in model.celebrities {
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(0, 0, 200, 50)
            // Make the button center at y, increment it
            button.center = CGPointMake(180, y)
            y = y + 60
            button.setTitle(celebrity, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitleShadowColor(UIColor.blackColor(), forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            button.tag = tag
            tag = tag + 1
            newView.addSubview(button)
        }
```

