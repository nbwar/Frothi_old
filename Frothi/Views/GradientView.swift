//
//  File.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/7/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit

class GradientView : UIView {
  let gradient:CAGradientLayer = CAGradientLayer()
  
  func drawGradient(view: UIView, colors: [AnyObject]) {
    gradient.frame = view.bounds
    gradient.colors = colors
    layer.insertSublayer(gradient, atIndex: 0)
  }
}
