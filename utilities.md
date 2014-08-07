
A function that creates a `UIView` with a certain background.
```swift
func createView(background:String) -> UIView {
  let width:CGFloat = 320
  let height:CGFloat = 480
  
  var newView:UIView = UIView(frame: CGRectMake(0, 0, width, height))
  var newImageView:UIImageView = UIImageView(frame: CGRectMake(0, 0, width, height))
  var newImage = UIImage(named: background)
  
  newView.addSubview(newImageView)
  newImageView.image = newImage
  return newView
}
```

Here's a function that creates a `UIButton`.
```swift
func createButton(name:String, action:Selector, x:CGFloat, y:CGFloat, width:CGFloat, height:CGFloat) -> UIButton {
  var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
  button.frame = CGRectMake(0, 0, width, height)
  button.center = CGPointMake(x, y)
  button.setTitle(name, forState:UIControlState.Normal)
  
  // Optional appearance-related things
  button.titleLabel.font = UIFont(name: "Helvetica", size: 30)
  button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
  button.setBackgroundImage(UIImage(named: "button-background"), forState: UIControlState.Normal)
  button.addTarget(self, action: action, forControlEvents: UIControlEvents.TouchUpInside)
  return button
}
```
