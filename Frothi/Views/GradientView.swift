import UIKit

class GradientView : UIView {
  let gradient:CAGradientLayer = CAGradientLayer()
  
  func drawGradient(view: UIView, colors: [AnyObject]) {
    gradient.frame = view.bounds
    gradient.colors = colors
    layer.insertSublayer(gradient, atIndex: 0)
  }
}
