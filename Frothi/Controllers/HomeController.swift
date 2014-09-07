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

    self.navigationController?.navigationBarHidden = false
    
    if (detailView != nil) {
      self.navigationController?.view.addSubview(detailView!)
      detailView?.backgroundColor = UIColor.blackColor()
      detailView?.alpha = 0
      
      spring(0.3, {
        self.detailView?.backgroundColor = UIColor.clearColor()
        self.detailView?.alpha = 1
      })
    }
  }
  
  
//  DetailViewDelegate Methods
  func closeButtonDidPress(detailView: DetailView, sender: AnyObject) {
    
    
    springWithCompletion(0.3, {
      self.detailView?.backgroundColor = UIColor.blackColor()
      self.detailView!.alpha = 0
    }, { finished in
      self.detailView!.removeFromSuperview()
      self.detailView = nil
        
    })

  }
}
