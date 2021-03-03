//
//  SceneDelegate.swift
//  Task 1
//
//  Created by Anton Yakushev on 3/1/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let mainVC = MainViewController(nibName: "MainViewController", bundle: nil)
        navigationController.viewControllers = [mainVC]
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}

