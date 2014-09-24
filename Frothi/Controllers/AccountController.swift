//
//  AccountController.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/21/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit

class AccountController : UIViewController {
  @IBOutlet weak var menuButton: UIBarButtonItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationController?.navigationBar

    menuButton.target = self.revealViewController()
    menuButton.action = Selector("revealToggle:")
    view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    
    navigationController?.navigationBar.barTintColor = UIColor(red: 0.051, green: 0.520, blue: 0.733, alpha: 1)
    let avenirNext:UIFont = UIFont(name: "Avenir Next", size: 20)
    let titleDict:NSDictionary = [NSFontAttributeName: avenirNext,NSForegroundColorAttributeName: UIColor.whiteColor()]
    navigationController?.navigationBar.titleTextAttributes = titleDict
  }
  
}
