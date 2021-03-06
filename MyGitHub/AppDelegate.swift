//
//  AppDelegate.swift
//  MyGitHub
//
//  Created by John LXThyme on 2017/3/27.
//  Copyright © 2017年 John LXThyme. All rights reserved.
//

import UIKit
import RESideMenu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        getAccessToken()

        print("kGitHubAccessToken:\(kGitHubAccessToken)")
//        kGitHubAccessToken = ""

//        if kGitHubAccessToken.characters.count != 40 {
//            let loginVC = LoginVC()
//            self.window?.rootViewController = loginVC
//        } else {
//        }

        let menu = initRESideMenu()
        self.window?.rootViewController = menu
        
        return true
    }
    func getAccessToken() {
        let accessToken = UserDefaults.standard.value(forKey: kGitHubAccessTokenUserDefaultsKey)
        if accessToken is String {
            let token = accessToken  as! String
            if token.characters.count == 40 {
                kGitHubAccessToken = token
            }
        }
    }
    func initRESideMenu() ->RESideMenu {
        let navLeft = UINavigationController(rootViewController: LeftVC())
        let navRight = UINavigationController(rootViewController: RightVC())
        let navMain = UINavigationController(rootViewController: MainVC())
        let menu = RESideMenu(contentViewController: navMain, leftMenuViewController: navLeft, rightMenuViewController: navRight)
        menu?.contentViewScaleValue = 0.95
        return menu!
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

