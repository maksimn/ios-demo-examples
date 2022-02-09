//
//  TableExampleRouter.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 09.02.2022.
//

import UIKit

final class RoutingToTableExample: CoreRouter {

    private let navigationController: UINavigationController
    private let tableExampleBuilder: TableExampleBuilder

    init(navigationController: UINavigationController, tableExampleBuilder: TableExampleBuilder) {
        self.navigationController = navigationController
        self.tableExampleBuilder = tableExampleBuilder
    }

    func navigate() {
        let tableExampleViewController = tableExampleBuilder.build()

        navigationController.topViewController?.present(tableExampleViewController, animated: true)
    }
}
