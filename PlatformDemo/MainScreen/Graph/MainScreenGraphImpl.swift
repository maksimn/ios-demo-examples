//
//  MainScreenGraphImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class MainScreenGraphImpl: MainScreenGraph {

    let navigationController = UINavigationController()

    init(viewParams: MainScreenViewParams,
         tableExampleBuilder: TableExampleBuilder) {
        let router = MainScreenRouterImpl(
            navigationController: navigationController,
            tableExampleBuilder: tableExampleBuilder
        )

        let viewController = MainScreenViewController(params: viewParams, router: router)

        navigationController.setViewControllers([viewController], animated: false)
    }
}
