//
//  AppDelegate.swift
//  FintechApp
//
//  Created by mac on 29/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       // if UserDefaults.standard.value(forKey: "user") != nil{
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            let navi = UINavigationController.init(rootViewController: vc)
            navi.navigationBar.isHidden = true
            appDelegate.window?.rootViewController = navi
//        }else{
//            let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//            let navi = UINavigationController.init(rootViewController: vc)
//            navi.navigationBar.isHidden = true
//            appDelegate.window?.rootViewController = navi
//        }
        appDelegate.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
          
      }
      
      func applicationDidEnterBackground(_ application: UIApplication) {
          
          // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
          // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
      }
      
      func applicationWillEnterForeground(_ application: UIApplication) {
          // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
          window!.rootViewController?.dismiss(animated: false)
      }
      
      func applicationDidBecomeActive(_ application: UIApplication) {
          // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
      }
      
      func applicationWillTerminate(_ application: UIApplication) {
          // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
      }
      
}
