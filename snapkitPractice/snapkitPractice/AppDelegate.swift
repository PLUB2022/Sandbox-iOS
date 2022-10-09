//
//  AppDelegate.swift
//  snapkitPractice
//
//  Created by 양유진 on 2022/10/09.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    
    let vc = ViewController()
    let navController = UINavigationController(rootViewController: vc)
    window?.rootViewController = navController
    
    return true
  }
}
