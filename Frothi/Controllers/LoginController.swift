import UIKit

class LoginController : UIViewController {
  @IBOutlet weak var backgroundBlurView: UIView!
  @IBOutlet weak var createAccountButton: UIButton!
  @IBOutlet weak var loginView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    BlurView.insertBlurView(backgroundBlurView, style: .Dark)
    loginView.alpha = 0
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(Bool())
    animateLoginView()
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
  func animateLoginView() {
    let scale = CGAffineTransformMakeScale(0.5, 0.5)
    let translate = CGAffineTransformMakeTranslation(0, -200)
    loginView.transform = CGAffineTransformConcat(scale, translate)
  
    spring(0.5) {
      let scale = CGAffineTransformMakeScale(1.0, 1.0)
      let translate = CGAffineTransformMakeTranslation(0, 0)
      self.loginView.transform = CGAffineTransformConcat(scale, translate)
    }
    loginView.alpha = 1
  }

}
