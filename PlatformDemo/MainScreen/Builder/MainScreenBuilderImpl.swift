//
//  MainScreenBuilderImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class MainScreenBuilderImpl: MainScreenBuilder {

    func build() -> UINavigationController {
        let navigationController = UINavigationController()

        let exampleNavigatorBuilder = ExampleNavigatorBuilderImpl(navigationController: navigationController)
        let viewController = MainScreenViewController(exampleNavigatorBuilder: exampleNavigatorBuilder)

        navigationController.viewControllers = [viewController]
        navigationController.navigationBar.isHidden = true
        
        return navigationController
    }
}
