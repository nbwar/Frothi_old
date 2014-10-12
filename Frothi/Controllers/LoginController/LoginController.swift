import UIKit

class LoginController : UIViewController {
  @IBOutlet weak var backgroundBlurView: UIView!
  @IBOutlet weak var createAccountButton: UIButton!
  @IBOutlet weak var loginView: UIView!
  @IBOutlet weak var emailField: UITextField!
  @IBOutlet weak var passwordField: UITextField!
  
  
  var animate:Bool = true
  
  override func viewDidLoad() {
    super.viewDidLoad()
    BlurView.insertBlurView(backgroundBlurView, style: .Dark)
    loginView.alpha = 0

  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(Bool())
    
    if animate {
      animateLoginView()
      animate = false
    }
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
  @IBAction func loginButtonPressed(sender: AnyObject) {
    let email = emailField.text!
    let password = passwordField.text!
    let data = ["email":email, "password":password]
    
    
    Session.login(data, success: { (operation, response) in
      println("operation \(operation.responseData)")
      println("response \(response)")

      //  Push to home controller or pop off the view stack depending how i implement the login screen
    }, failure: { (operation, response) in
      println("operation \(operation.responseData)")
      println("response \(response)")
        
    })
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
