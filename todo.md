# A todo list

Today we're making a simple app to store and manage a todo list.

The first step was to make a **Tabbed View Application**. In your first view, we added a table view and wired it to the controller by right clicking on the table view, and dragging from the outlet to the yellow controller icon.

Then, modify your `FirstViewController.swift` file to add in the `UITableViewDataSource` and `UITableViewDelegate` protocols. The code below has the unimplemented methods.
```swift

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "")
        var label:UILabel = UILabel()
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

## Making the model

Here's a starting point for you to add an implementation to (hint hint nudge nudge, make a list)
```swift
class TodoModel {
    init() {
        addTodo("foo")
    }
    
    func addTodo(name:String) {
        
    }
    
    func getTodo(index:Int) -> String {
        return ""
    }
    
    func getTodoCount() -> Int {
        return 0
    }
}
```

Here's the completed model:
```swift
class TodoModel {
    
    var todos:[String] = []
    
    init() {
        self.addTodo("Eat breakfast")
        self.addTodo("Eat lunch")
        self.addTodo("Eat dinner")
    }
    
    func addTodo(name:String) {
        todos += name
    }
    
    func getTodo(index:Int) -> String {
        return todos[index]
    }
    
    func getTodoCount() -> Int {
        return todos.count
    }
}
```

## Make your model global

Take the model variable out of the `FirstViewController` class and put it directly into the Swift file - this allows you to access and refer to it from the `SecondViewController`.

## Wiring up the add item

On the button we're wiring up the "Touch Up Inside" to an `@IBAction` function.

First make the `@IBAction` function:
```swift
    @IBAction func buttonClicked(sender:UIButton) {
        println(textField.text)
        model.addTodo(textField.text)
    }
```

On the text field, we're wiring up a Referencing Outlet to an `@IBOutlet` in our view controller.
```swift
@IBOutlet var textField:UITextField;
```

You also need to wire the `UITextFieldDelegate` as a delegate of the text field.

## Refreshing the table view

First make the `IBOutlet` and `IBAction`.
```swift
    @IBOutlet var tableView:UITableView;
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
```

Wire a referencing outlet from the table view to the `tableView` outlet in your code.
