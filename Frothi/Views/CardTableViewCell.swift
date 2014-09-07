import UIKit

protocol CardTableViewCellDelegate {
  func detailButtonDidPress(cell: CardTableViewCell ,sender: AnyObject)
}

class CardTableViewCell : UITableViewCell {
  var delegate: CardTableViewCellDelegate?
  

  @IBAction func detailButtonDidPress(sender: AnyObject) {
     delegate?.detailButtonDidPress(self, sender: sender)
  }
  
}
