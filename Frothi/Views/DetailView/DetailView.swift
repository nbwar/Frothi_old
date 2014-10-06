import UIKit

protocol DetailViewDelegate {
  func closeButtonPressed(detailView: DetailView ,sender: AnyObject)
}

class DetailView : UIView {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var descriptionTextView: UITextView!
  @IBOutlet weak var nameLabel: UILabel!

  var delegate: DetailViewDelegate?
  
  
  @IBAction func closeButtonPressed(sender: AnyObject) {
    delegate?.closeButtonPressed(self, sender: sender)
  }
}
