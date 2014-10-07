import UIKit
import QuartzCore

class OrderController : UIViewController, UITableViewDelegate, UITableViewDataSource {
  let blueColor = UIColor(red: 42/255, green: 95/255, blue: 124/255, alpha: 1.0).CGColor
  let orangeColor = UIColor(red: 57/255, green: 35/255, blue: 13/225, alpha: 1.0).CGColor
  var cart:Cart!
  
  @IBOutlet weak var gradientView: GradientView!

  
  @IBAction func backButtonPressed(sender: AnyObject) {
    navigationController?.popViewControllerAnimated(true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let colors:[AnyObject] = [blueColor, orangeColor]
    gradientView.drawGradient(colors)
  }
  
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return cart.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Order", forIndexPath: indexPath) as OrderTableViewCell
    var ids:Array = cart.ids()
    if !ids.isEmpty {
      var id = ids[indexPath.row]
      var item = cart.items[id]!
      cell.nameLabel.text = item.name
      cell.priceLabel.text = "$\(item.price * item.quantity)"
      cell.quantityLabe.text = "\(item.quantity)"
    }


    return cell
  }
  
  
  
}
