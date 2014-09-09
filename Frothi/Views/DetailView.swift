//
//  DetailView.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/7/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit

protocol DetailViewDelegate {
  func closeButtonPressed(detailView: DetailView ,sender: AnyObject)
}

class DetailView : UIView {
  var delegate: DetailViewDelegate?
  
  
  @IBAction func closeButtonPressed(sender: AnyObject) {
    delegate?.closeButtonPressed(self, sender: sender)
  }
}
