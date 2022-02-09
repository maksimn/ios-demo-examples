//
//  TableExampleRouter.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 09.02.2022.
//

import UIKit

final class RoutingToTableExample: CoreRouter {

    private let viewController: UIViewController
    private let tableExampleBuilder: TableExampleBuilder

    init(viewController: UIViewController, tableExampleBuilder: TableExampleBuilder) {
        self.viewController = viewController
        self.tableExampleBuilder = tableExampleBuilder
    }

    func navigate() {
        let tableExampleViewController = tableExampleBuilder.build()

        viewController.present(tableExampleViewController, animated: true)
    }
}
