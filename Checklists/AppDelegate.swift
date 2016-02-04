//
//  AppDelegate.swift
//  Checklists
//
//  Created by MyMacbook on 1/24/16.
//  Copyright © 2016 Oleksandr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let dataModel = DataModel()
    var window: UIWindow?

    func saveData() {
        dataModel.saveChecklists()
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        saveData()
    }
    
    func applicationWillTerminate(application: UIApplication) {
        saveData()
    }

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let navigationController = window!.rootViewController as! UINavigationController
        let controller = navigationController.viewControllers[0] as! AllListsViewController
        controller.dataModel = dataModel
        return true
    }
    //The best place to share the DataModel instance with AllListsViewController is in the application(didFinishLaunchingWithOptions) method, which gets called as soon as the app starts up.

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

   

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }



}

