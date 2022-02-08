//
//  MainScreenRouterImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class MainScreenRouterImpl: MainScreenRouter {

    private let navigationController: UINavigationController
    private let tableExampleBuilder: TableExampleBuilder

    init(navigationController: UINavigationController,
         tableExampleBuilder: TableExampleBuilder) {
        self.navigationController = navigationController
        self.tableExampleBuilder = tableExampleBuilder
    }

    func navigateToTableExample() {
        let tableExampleViewController = tableExampleBuilder.build()

        navigationController.pushViewController(tableExampleViewController, animated: true)
    }
}
