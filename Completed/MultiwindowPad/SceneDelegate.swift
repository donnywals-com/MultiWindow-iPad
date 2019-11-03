//
//  SceneDelegate.swift
//  MultiwindowPad
//
//  Created by Wals, Donny on 25/10/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = CatsOverviewViewController()
      window.backgroundColor = .white
      self.window = window
      window.makeKeyAndVisible()
    }
  }  
}

