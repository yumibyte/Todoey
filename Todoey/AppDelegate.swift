//
//  AppDelegate.swift
//  Todoey
//
//  Created by Ashley Raigosa on 7/8/19.
//  Copyright © 2019 Ashley Raigosa. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Error initalizing new realm, \(error)")
        }
        
        return true
    }

}

