import UIKit

class HomeController : UITableViewController, CardTableViewCellDelegate {

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.backgroundView = UIImageView(image:UIImage(named:"bg-home"))
    self.tableView.separatorColor = UIColor.clearColor()
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as CardTableViewCell
    cell.delegate = self

    return cell
  }
  
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
  }
  
  func detailButtonDidPress(cell: CardTableViewCell, sender: AnyObject) {
    println("PUSHHEDD")
  }
}
