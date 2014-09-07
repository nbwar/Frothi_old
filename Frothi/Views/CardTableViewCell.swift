import UIKit

protocol CardTableViewCellDelegate {
  func detailButtonDidPress(cell: CardTableViewCell ,sender: AnyObject)
}

class CardTableViewCell : UITableViewCell {
  var delegate: CardTableViewCellDelegate?
  
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var imageButton: UIButton!
  
  
  
  @IBAction func imageButtonDidPress(sender: AnyObject) {
    delegate?.detailButtonDidPress(self, sender: sender)
  }
  
  @IBAction func plusButtonDidPress(sender: AnyObject) {
  }
  
  @IBAction func minusButtonDidPress(sender: AnyObject) {
  }
  
}
