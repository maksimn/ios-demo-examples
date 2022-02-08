//
//  SceneDelegate.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 17.09.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let mainScreenBuilder = MainScreenBuilderImpl()
        let mainScreenViewController = mainScreenBuilder.build()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = mainScreenViewController
        window?.makeKeyAndVisible()
    }
}
