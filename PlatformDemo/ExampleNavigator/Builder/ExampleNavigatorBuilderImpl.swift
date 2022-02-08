//
//  ExampleNavigatorImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class ExampleNavigatorBuilderImpl: ExampleNavigatorBuilder {

    private let viewControllerBlock: () -> UIViewController?

    init(viewControllerBlock: @escaping () -> UIViewController?) {
        self.viewControllerBlock = viewControllerBlock
    }
    
    func build() -> ExampleNavigator {
        let viewController = viewControllerBlock()
        let exampleItem = ExampleItem(
            title: "Table view with cells with different height.",
            router: TableExampleRouter(viewController: viewController ?? UIViewController(),
                                       tableExampleBuilder: TableExampleBuilderImpl())
        )

        return ExampleNavigatorImpl(exampleItems: [exampleItem])
    }
}
