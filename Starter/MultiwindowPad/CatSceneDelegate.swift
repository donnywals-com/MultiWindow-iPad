//
//  CatSceneDelegate.swift
//  MultiwindowPad
//
//  Created by Wals, Donny on 29/10/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import UIKit

class CatSceneDelegate: UIResponder, UISceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let detail: CatDetailViewController
    if let activity = connectionOptions.userActivities.first ?? session.stateRestorationActivity,
      let identifier = activity.targetContentIdentifier {
      detail = CatDetailViewController(catName: identifier)
    } else {
      detail = CatDetailViewController(catName: "default")
    }

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = detail
      window.backgroundColor = .white
      self.window = window
      window.makeKeyAndVisible()
    }
  }

  override func restoreUserActivityState(_ activity: NSUserActivity) {
    super.restoreUserActivityState(activity)
    print("WILL RESTORE")
  }

  func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
    return scene.userActivity
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    scene.session.stateRestorationActivity = scene.userActivity
  }

  func sceneWillResignActive(_ scene: UIScene) {
    scene.session.stateRestorationActivity = scene.userActivity
  }
}
