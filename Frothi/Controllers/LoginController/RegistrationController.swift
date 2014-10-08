import UIKit

class RegistrationController : UIViewController {
  let blueColor = UIColor(red: 42/255, green: 95/255, blue: 124/255, alpha: 1.0).CGColor
  let orangeColor = UIColor(red: 57/255, green: 35/255, blue: 13/225, alpha: 1.0).CGColor
  
  @IBOutlet var gradientView: GradientView!
  
  @IBAction func closeButtonPressed(sender: AnyObject) {
    dismissViewControllerAnimated(true, nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.barTintColor = UIColor(red: 0.051, green: 0.520, blue: 0.733, alpha: 1)
    let avenirNext:UIFont = UIFont(name: "Avenir Next", size: 20)
    let titleDict:NSDictionary = [NSFontAttributeName: avenirNext,NSForegroundColorAttributeName: UIColor.whiteColor()]
    navigationController?.navigationBar.titleTextAttributes = titleDict
    
    let colors:[AnyObject] = [blueColor, orangeColor]
    gradientView.drawGradient(colors)
  }
}