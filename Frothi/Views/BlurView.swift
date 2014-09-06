//
//  BlurView.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/5/14.
//  Copyright (c) 2014 nick. All rights reserved.
//
import UIKit
class BlurView {
  class func insertBlurView(view: UIView, style: UIBlurEffectStyle) {
    view.backgroundColor = UIColor.clearColor()
    
    var blurEffect = UIBlurEffect(style: style)
    var blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    view.insertSubview(blurEffectView, atIndex: 0)
  }
}
