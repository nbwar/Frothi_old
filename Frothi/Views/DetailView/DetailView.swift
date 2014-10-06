import UIKit

protocol DetailViewDelegate {
  func closeButtonPressed(detailView: DetailView ,sender: AnyObject)
}

class DetailView : UIView {
  var delegate: DetailViewDelegate?
  
  
  @IBAction func closeButtonPressed(sender: AnyObject) {
    delegate?.closeButtonPressed(self, sender: sender)
  }
}
