import UIKit

class SideMenuController : UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var gradientView: GradientView!
  @IBOutlet weak var tableView: UITableView!
  
  let blueColor = UIColor(red: 42/255, green: 95/255, blue: 124/255, alpha: 1.0).CGColor
  let orangeColor = UIColor(red: 57/255, green: 35/255, blue: 13/225, alpha: 1.0).CGColor
  

  let navigation:Array<String> = ["Menu" , "Account"]
  let cellIdentifier:String = "Navigation"
  
  var homeController:UINavigationController!
  var selected:String = ""

  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    
    setupGradient()
  }
  
  // UITableViewDataSource methods
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return navigation.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
      cell.textLabel?.text = navigation[indexPath.row]
      return cell
  }
  

  //  UITableViewDelegate Methods
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    var newFrontController:UIViewController
    let selectedNav:String = navigation[indexPath.row]
    var selected:String = ""
    
    switch selectedNav {
    case "Menu":
      newFrontController = homeController
      selected = "MenuSelected"
    case "Account":
      let storyboard = UIStoryboard(name: "AccountController", bundle: nil)
      let accountController = storyboard.instantiateViewControllerWithIdentifier("AccountController") as AccountController
      newFrontController = UINavigationController(rootViewController: accountController)
      selected = "AccountSelected"
    default:
      newFrontController = UINavigationController(rootViewController: HomeController())
      println("Default")
    }
    self.revealViewController().pushFrontViewController(newFrontController, animated: true)
    
//    let alert = UIAlertController(title: "Item selected", message: "You selected item \(indexPath.row), selectedNav: \(selectedNav), selected: \(selected)", preferredStyle: UIAlertControllerStyle.Alert)
//    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
//    self.presentViewController(alert, animated: true, completion: nil)
  }

//
//  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//    println(indexPath.row)
//    var selectedNav:String = navigation[indexPath.row]
//    var newFrontController:UIViewController
//    
//    println("Selected: \(selectedNav)" )
//    switch selectedNav {
//    case "Menu":
//      newFrontController = UINavigationController(rootViewController: HomeController())
//      println("Menu")
//    case "Account":
//      newFrontController = UINavigationController(rootViewController: AccountController())
//      println("Account")
//    default:
//      newFrontController = UINavigationController(rootViewController: HomeController())
//    }
//    
//    //    self.revealViewController().pushFrontViewController(newFrontController, animated: true)
//    
//  }
  
  

//
  
//  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//    println(indexPath.row)
//    var selectedNav:String = menu[indexPath.row]
//    var newFrontController:UIViewController
//    
//    println("Selected: \(selectedNav)" )
//    switch selectedNav {
//    case "Menu":
//      newFrontController = UINavigationController(rootViewController: HomeController())
//      println("Menu")
//    case "Account":
//      newFrontController = UINavigationController(rootViewController: AccountController())
//      println("Account")
//    default:
//      newFrontController = UINavigationController(rootViewController: HomeController())
//    }
//    
////    self.revealViewController().pushFrontViewController(newFrontController, animated: true)
//    
//  }
  
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    
  }
  
  func setupGradient() {
    let colors:[AnyObject] = [blueColor, orangeColor]
    gradientView.drawGradient(view, colors: colors)
  }

}
