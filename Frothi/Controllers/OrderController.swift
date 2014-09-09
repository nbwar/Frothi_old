//
//  OrderController.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/7/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit
import QuartzCore

class OrderController : UIViewController, UITableViewDelegate, UITableViewDataSource {
  let blueColor = UIColor(red: 42/255, green: 95/255, blue: 124/255, alpha: 1.0).CGColor
  let orangeColor = UIColor(red: 57/255, green: 35/255, blue: 13/225, alpha: 1.0).CGColor
  
  @IBOutlet weak var gradientView: GradientView!
  
  @IBAction func backButtonPressed(sender: AnyObject) {
    navigationController?.popViewControllerAnimated(true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupGradient()
  }
  
  func setupGradient() {
    let colors:[AnyObject] = [blueColor, orangeColor]
    gradientView.drawGradient(view, colors: colors)
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Order", forIndexPath: indexPath) as UITableViewCell
    return cell
  }
  
  
  
}
