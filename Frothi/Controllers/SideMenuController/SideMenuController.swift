import UIKit

class SideMenuController : UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var gradientView: GradientView!
  @IBOutlet weak var tableView: UITableView!
  
  let blueColor = UIColor(red: 42/255, green: 95/255, blue: 124/255, alpha: 1.0).CGColor
  let orangeColor = UIColor(red: 57/255, green: 35/255, blue: 13/225, alpha: 1.0).CGColor
  

  let navigation:Dictionary<String,String> = ["Menu": "icon-cup", "Account": "icon-account", "Service Areas": "icon-map"]
  let cellIdentifier:String = "Navigation"
  
  var homeController:UINavigationController!
  var activeIndexPath:NSIndexPath?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupGradient()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    setActiveCell()
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  
  // UITableViewDataSource methods
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return navigation.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as NavigationTableViewCell
    let key = Array(navigation.keys)[indexPath.row]
    let icon = navigation[key]!
    
    cell.navLabel?.text = key
    cell.navImageView.image = UIImage(named: icon)
    
    if key == "Menu" {
      activeIndexPath = indexPath
    }
    
    return cell
  }
  

  //  UITableViewDelegate Methods
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
    var newFrontController:UIViewController
    let selectedNav:String = Array(navigation.keys)[indexPath.row]
    activeCellDidChange(indexPath)
    
    switch selectedNav {
    case "Menu":
      newFrontController = homeController
    case "Account":
      let storyboard = UIStoryboard(name: "AccountController", bundle: nil)
      newFrontController = storyboard.instantiateInitialViewController() as UINavigationController
      
    case "Service Areas":
      let storyboard = UIStoryboard(name: "ServiceAreasController", bundle: nil)
      newFrontController = storyboard.instantiateInitialViewController() as UINavigationController
      
    default:
      newFrontController = homeController
    }
    self.revealViewController().pushFrontViewController(newFrontController, animated: true)

  }

  
  //  Helpers
  func setupGradient() {
    let colors:[AnyObject] = [blueColor, orangeColor]
    gradientView.drawGradient(view, colors: colors)
  }
  
  func activeCellDidChange(newIndexPath:NSIndexPath) {
    if let unwrappedActiveIndexPath = activeIndexPath {
      let keys = Array(navigation.keys)
      let prevActiveCell = tableView.cellForRowAtIndexPath(unwrappedActiveIndexPath) as NavigationTableViewCell
      let newActiveCell = tableView.cellForRowAtIndexPath(newIndexPath) as NavigationTableViewCell
      let prevKey = keys[unwrappedActiveIndexPath.row]
      let prevIcon = navigation[prevKey]!
      let newKey = keys[newIndexPath.row]
      let newIcon = navigation[newKey]!
      
      prevActiveCell.navImageView.image = UIImage(named: prevIcon)
      newActiveCell.navImageView.image = UIImage(named: "\(newIcon)-active")
      
      activeIndexPath = newIndexPath
    }
  }
  
  func setActiveCell() {
    activeCellDidChange(activeIndexPath!)
  }

}
