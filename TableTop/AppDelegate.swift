//
//  AppDelegate.swift
//  TableTop
//
//  Created by Josh Ransom on 9/7/14.
//  Copyright (c) 2014 Josh Ransom. All rights reserved.
//

import UIKit
import CoreLocation
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        // If add to plist make sure you copy everyone else on it.
        
        let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
        if let dict = NSDictionary(contentsOfFile: path!){
            let envVariables = dict.valueForKey("LSEnvironment") as? NSDictionary
            let appID = envVariables?.valueForKey("parseAppID") as? String
            let clientKey = envVariables?.valueForKey("parseClientKey") as? String
            Parse.setApplicationId(appID!, clientKey: clientKey!)
            return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        }
        else {
            NSLog("APP SETTINGS FILE NOT FOUND. DID YOU FORGET YOUR PLIST?")
        }
        
        
        
        //        var testObject = PFObject(className: "TestObject")
        //        testObject["foo"] = "bar"
        //        testObject.saveInBackgroundWithTarget(nil , selector: nil )
        
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
//    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
//        // Override point for customization after application launch.
//        // If add to plist make sure you copy everyone else on it. 
//        
//        let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist")
//        if let dict = NSDictionary(contentsOfFile: path!){
//            let envVariables = dict.valueForKey("LSEnvironment") as? NSDictionary
//            let appID = envVariables?.valueForKey("parseAppID") as? String
//            let clientKey = envVariables?.valueForKey("parseClientKey") as? String
//            Parse.setApplicationId(appID!, clientKey: clientKey!)
//        }
//        else {
//            NSLog("APP SETTINGS FILE NOT FOUND. DID YOU FORGET YOUR PLIST?")
//        }
//        
//        
//        
////        var testObject = PFObject(className: "TestObject")
////        testObject["foo"] = "bar"
////        testObject.saveInBackgroundWithTarget(nil , selector: nil )
//
//        return true
//    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication! ){
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

