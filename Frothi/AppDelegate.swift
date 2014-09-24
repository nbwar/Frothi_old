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
  
//  self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
//  self.window!.backgroundColor = UIColor.whiteColor()
//  var splitViewController =  UISplitViewController()
//  var rootViewController = RootViewController()
//  var detailViewController = DetailViewController()
//  var rootNavigationController = UINavigationController(rootViewController:rootViewController)
//  var detailNavigationController = UINavigationController(rootViewController:detailViewController)
//  splitViewController.viewControllers = [rootNavigationController,detailNavigationController]
//  self.window!.rootViewController = splitViewController
//  self.window!.makeKeyAndVisible()
//  return true

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
//    let homeController = HomeController()
//    let sideMenuController = SideMenuController()
    
    let mainStoryboard = UIStoryboard(name: "HomeController", bundle: nil)
    let homeController = mainStoryboard.instantiateViewControllerWithIdentifier("HomeController") as HomeController
    var homeNavigationController = UINavigationController(rootViewController: homeController)
    
    let sideMenuStoryboard = UIStoryboard(name: "SideMenuController", bundle: nil)
    let sideMenuController = sideMenuStoryboard.instantiateViewControllerWithIdentifier("SideMenuController") as SideMenuController
    sideMenuController.homeController = homeNavigationController
    
//
//    var homeNavigationController = UINavigationController(rootViewController: homeController)
    var revealController = SWRevealViewController(rearViewController: sideMenuController, frontViewController: homeNavigationController)
//
//    revealController.delegate = self
    
    window?.rootViewController = revealController
    window?.makeKeyAndVisible()
//
    
    return true
  }
  
//  UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//  self.window = window;
//  
//  FrontViewController *frontViewController = [[FrontViewController alloc] init];
//  RearViewController *rearViewController = [[RearViewController alloc] init];
//  
//  UINavigationController *frontNavigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
//  UINavigationController *rearNavigationController = [[UINavigationController alloc] initWithRootViewController:rearViewController];
//  
//  SWRevealViewController *mainRevealController = [[SWRevealViewController alloc]
//  initWithRearViewController:rearNavigationController frontViewController:frontNavigationController];
//  
//  mainRevealController.delegate = self;
//  
//  self.viewController = mainRevealController;
//  
//  self.window.rootViewController = self.viewController;
//  [self.window makeKeyAndVisible];
//  return YES;

  func applicationWillResignActive(application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

