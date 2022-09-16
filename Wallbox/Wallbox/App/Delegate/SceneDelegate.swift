//
//  SceneDelegate.swift
//  Wallbox
//
//  Created by Manuel Martinez Gomez on 16/9/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    window = UIWindow(windowScene: scene)
    window?.rootViewController = initialController()
    window?.makeKeyAndVisible()
  }
}

private extension SceneDelegate {
  private func initialController() -> UINavigationController {
    let navigation = UINavigationController(rootViewController: ViewController())
    return navigation
  }
}
