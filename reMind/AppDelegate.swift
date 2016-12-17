//
//  AppDelegate.swift
//  reMind
//
//  Created by Benjamín Garrido Barreiro on 13/12/16.
//  Copyright © 2016 Benjamín Garrido Barreiro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Cargamos nuestro array (del singleton)
        TaskManager.sharedInstance.load()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        TaskManager.sharedInstance.save()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        TaskManager.sharedInstance.save()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        TaskManager.sharedInstance.load()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        TaskManager.sharedInstance.load()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        TaskManager.sharedInstance.save()
    }


}

