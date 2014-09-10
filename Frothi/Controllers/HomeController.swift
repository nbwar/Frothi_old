import UIKit

class HomeController : UITableViewController, CardTableViewCellDelegate, DetailViewDelegate {
  let cart = Cart()
  
  var detailView:DetailView?
  
  var data = getData()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.backgroundView = UIImageView(image:UIImage(named:"bg-home"))
    self.tableView.separatorColor = UIColor.clearColor()
    

    
  }
  
//  Segues
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "homeToOrder" {
      let orderController:OrderController = segue.destinationViewController as OrderController
      orderController.cart = cart
    }
  }
  
  
//  TableViewDelegate Methods
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as CardTableViewCell
    cell.delegate = self
    
    var item = data[indexPath.row]
    cell.setup(item)

//    var item = data[indexPath.row]
//    println(item.name)
//    cell.nameLabel.text = item.name
//    cell.priceLabel.text = "$\(item.price)"
//    
//    
//    cell.imageButton.setImage(UIImage(named: item.image), forState: UIControlState.Normal)
//    cell.imageButton.setImage(UIImage(named: item.image), forState: UIControlState.Highlighted)




    return cell
  }
  
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
  }
  
//  CardTableViewCellDelegate Methods
  
  func detailButtonPressed(cell: CardTableViewCell, sender: AnyObject) {
    detailView = NSBundle.mainBundle().loadNibNamed("DetailView", owner: self, options: nil).first as? DetailView
    detailView?.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
    detailView?.delegate = self
    
    if (detailView != nil) {
      addViewToNavigationControllerWithAnimation(detailView!)
    }
  }
  
  func plusButtonPressed(cell: CardTableViewCell, sender: AnyObject) {
    var number = cell.amountLabel.text?.toInt()!
    number! += 1
    cell.amountLabel.text = "\(number!)"
  }
  
  func minusButtonPressed(cell: CardTableViewCell, sender: AnyObject) {
    var number = cell.amountLabel.text?.toInt()!
    if number > 1 {
      number! -= 1
    } else {
      number = 0
    }
    cell.amountLabel.text = "\(number!)"
  }
  
  
//  DetailViewDelegate Methods
  
  func closeButtonPressed(detailView: DetailView, sender: AnyObject) {
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
