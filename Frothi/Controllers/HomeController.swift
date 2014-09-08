import UIKit

class HomeController : UITableViewController, CardTableViewCellDelegate, DetailViewDelegate {
  
  var detailView:DetailView?
  
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
  
//  CardTableViewCellDelegate Methods
  
  func detailButtonDidPress(cell: CardTableViewCell, sender: AnyObject) {
    detailView = NSBundle.mainBundle().loadNibNamed("DetailView", owner: self, options: nil).first as? DetailView
    detailView?.frame = CGRectMake(0, 0, view.frame.width, view.frame.height)
    detailView?.delegate = self
    
    if (detailView != nil) {
      addViewToNavigationControllerWithAnimation(detailView!)
    }
  }
  
  
//  DetailViewDelegate Methods
  
  func closeButtonDidPress(detailView: DetailView, sender: AnyObject) {
    removeViewFromNaviagtionControllerWithAnimation(detailView)
    self.detailView = nil
  }
  
//  Helpers
  
  func addViewToNavigationControllerWithAnimation(viewToAdd: UIView) {
    self.navigationController?.view.addSubview(viewToAdd)
    viewToAdd.backgroundColor = UIColor.blackColor()
    viewToAdd.alpha = 0
    
    spring(0.3, {
      viewToAdd.backgroundColor = UIColor.clearColor()
      viewToAdd.alpha = 1
    })
  }
  
  func removeViewFromNaviagtionControllerWithAnimation(viewToRemove: UIView) {
    springWithCompletion(0.3, {
      viewToRemove.backgroundColor = UIColor.blackColor()
      viewToRemove.alpha = 0
      }, { finished in
        viewToRemove.removeFromSuperview()
    })
  }
} // end
