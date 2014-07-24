# Flappy bird day

We started by adding the assets from `flappy-images` in this repository to your `Images.xcassets` folder.

Then, we set the background color and set up the images as sprites in our game.
```swift
    var bird:SKSpriteNode = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        // Set the background color
        self.backgroundColor = UIColor(red: 111.0 / 255.0, green: 195.0 / 255.0, blue: 211.0 / 255.0, alpha: 1)
        
        // Make the bird (first make the texture, then add it to a sprite node)
        let birdTexture = SKTexture(imageNamed: "bird1")
        birdTexture.filteringMode = .Nearest
        // Actually make the node
        bird = SKSpriteNode(texture: birdTexture)
        bird.position = CGPoint(x: self.frame.size.width * 0.35, y:self.frame.size.height * 0.6)
        bird.xScale = 2
        bird.yScale = 2
        self.addChild(bird)
        
        
        let ground = SKSpriteNode(imageNamed: "ground")
        ground.anchorPoint = CGPointMake(0, 0)              // anchor the ground to it's origin
        ground.size.width = self.size.width                 // make ground width same as window
        self.addChild(ground)
    }
```

## Adding in the physics

Tell the world that it has gravity
```swift
override func didMoveToView(view: SKView) {
        self.physicsWorld.gravity = CGVectorMake( 0.0, -5.0 )
        ...
        
}
```

Set up the bird's physics body
```swift
bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2.0)
bird.physicsBody.dynamic = true
bird.physicsBody.allowsRotation = false
```

For layering correctly:
```swift
bird.zPosition = -2
```

Change the `touchesBegan` function to reflect the only moving thing in the game
```swift
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if touches.count > 0 {
            bird.physicsBody.velocity = CGVectorMake(0, 0)
            bird.physicsBody.applyImpulse(CGVectorMake(0, 10))
        }
    }
```






