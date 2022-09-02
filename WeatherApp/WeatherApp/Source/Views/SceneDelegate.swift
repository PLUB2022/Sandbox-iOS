//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by 홍승현 on 2022/08/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let scene = scene as? UIWindowScene else { return }

    let window = UIWindow(windowScene: scene)
    self.window = window

    let navigationController = UINavigationController()
    navigationController.navigationBar.tintColor = .white
    window.rootViewController = navigationController

    let coordinator = HomeCoordinator(navigationController: navigationController)
    coordinator.start()

    window.makeKeyAndVisible()
  }
}
