import UIKit

protocol CardTableViewCellDelegate {
  func detailButtonPressed(cell: CardTableViewCell ,sender: AnyObject)
  func plusButtonPressed(cell: CardTableViewCell, sender: AnyObject)
  func minusButtonPressed(cell: CardTableViewCell, sender: AnyObject)
}

class CardTableViewCell : UITableViewCell {
  var delegate: CardTableViewCellDelegate?
  
  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var imageButton: UIButton!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  
  
  @IBAction func imageButtonPressed(sender: AnyObject) {
    delegate?.detailButtonPressed(self, sender: sender)
  }
  
  @IBAction func plusButtonPressed(sender: AnyObject) {
    delegate?.plusButtonPressed(self, sender: sender)
  }
  
  @IBAction func minusButtonPressed(sender: AnyObject) {
    delegate?.minusButtonPressed(self, sender: sender)
  }
  
}
