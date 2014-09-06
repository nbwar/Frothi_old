//
//  LoginViewController.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/5/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
  @IBOutlet weak var backgroundBlurView: UIView!
  @IBOutlet weak var createAccountButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    BlurView.insertBlurView(backgroundBlurView, style: UIBlurEffectStyle.Dark)
    
//    createAccountButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Highlighted)
    
    
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
}
