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
  var cart:Cart?
  
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
  
//  NSArray* keys = [self.data allKeys];
//  
//  cell.textLabel.text = [self.data objectForKey:[keys objectAtIndex:indexPath.row]];
//  
//  return cell;
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Order", forIndexPath: indexPath) as OrderTableViewCell
//    let keys:[Int] = cart?.ids()?
    
//    ids = [4,23,23,2]
//    id = ids[indexPath.row]
//    item = cart[id] 
//    cell.nameLabel = item.name
//

    if let ids:Array = cart?.ids() {
      if !ids.isEmpty {
        var id = ids[indexPath.row]
        println("ID:")
        println(id)

//        cell.nameLabel.text = item.name
//        cell.quantityLabe.text = item.quantity
//        cell.priceLabel.text = item.price
        
//        var item:Item = cart?[id]
//        cell.nameLabel.text = item.name
//        cell.priceLabel = item.price
//        cell.quantityLabe = item.quantity
      }
      
      
      
    }

    
//    var id = keys![indexPath.row]
//    var item = cart?.items[id]
    

//    var price = item?.price
//    var quantity = item?.quantity
//    var total = price! * quantity!
    

//    cell.nameLabel.text = item?.name
    
    
    
    
    
    
    
    
    
    
    
//    var ids = [1,23,4,5]
//    var items = [1: "foo", 23: "free"]
//    
//    var id = items[ids.first!]!
    
    
//    let explicitShort:[String] = array
//    [1,2,3,4]
//      { 1 => Item}
//    let key:Int = keys[indexPath.row]
    
    
    
    
//    cart[keys.first]
    
//    keys
//    cell.nameLabel =
    return cell
  }
  
  
  
}
