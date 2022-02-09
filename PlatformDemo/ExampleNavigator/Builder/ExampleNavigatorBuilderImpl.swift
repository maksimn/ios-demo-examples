//
//  ExampleNavigatorImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class ExampleNavigatorBuilderImpl: ExampleNavigatorBuilder {

    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func build() -> ExampleNavigator {
        let exampleNavigatorItem = ExampleNavigatorItem(
            title: "Table view with cells with different height.",
            router: RoutingToTableExample(navigationController: navigationController,
                                          tableExampleBuilder: TableExampleBuilderImpl())
        )

        return ExampleNavigatorImpl(items: [exampleNavigatorItem])
    }
}
