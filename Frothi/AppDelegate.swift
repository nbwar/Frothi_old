//
//  AppDelegate.swift
//  Frothi
//
//  Created by Nicholas Wargnier on 9/5/14.
//  Copyright (c) 2014 nick. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SWRevealViewControllerDelegate {
                            
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    let mainStoryboard = UIStoryboard(name: "HomeController", bundle: nil)
    let homeController = mainStoryboard.instantiateInitialViewController() as UINavigationController
    let sideMenuStoryboard = UIStoryboard(name: "SideMenuController", bundle: nil)
    let sideMenuController = sideMenuStoryboard.instantiateInitialViewController() as SideMenuController
    
    sideMenuController.homeController = homeController
    
    var revealController = SWRevealViewController(rearViewController: sideMenuController, frontViewController: homeController)
//    revealController.rearViewRevealWidth = 215
    
    window?.rootViewController = revealController
    window?.makeKeyAndVisible()
    
    return true
  }
  

  func applicationWillResignActive(application: UIApplication) {

  }

  func applicationDidEnterBackground(application: UIApplication) {

  }

  func applicationWillEnterForeground(application: UIApplication) {

  }

  func applicationDidBecomeActive(application: UIApplication) {

  }

  func applicationWillTerminate(application: UIApplication) {

  }


}

