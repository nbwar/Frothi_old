import UIKit

class GradientView : UIView {
  let gradient:CAGradientLayer = CAGradientLayer()
  
  func drawGradient(colors: [AnyObject]) {
    gradient.frame = self.bounds
    gradient.colors = colors
    layer.insertSublayer(gradient, atIndex: 0)
  }
}
