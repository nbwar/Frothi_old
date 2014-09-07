//
//  DetailView.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/7/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit

protocol DetailViewDelegate {
  func closeButtonDidPress(detailView: DetailView ,sender: AnyObject)
}

class DetailView : UIView {
  var delegate: DetailViewDelegate?
  
  
  @IBAction func closeButtonDidPress(sender: AnyObject) {
    delegate?.closeButtonDidPress(self, sender: sender)
  }
}
