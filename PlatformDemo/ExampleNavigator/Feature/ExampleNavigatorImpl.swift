//
//  ExampleNavigatorImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

final class ExampleNavigatorImpl: ExampleNavigator {

    private let exampleItems: [ExampleItem]

    init(exampleItems: [ExampleItem]) {
        self.exampleItems = exampleItems
    }

    var numberOfExamples: Int {
        exampleItems.count
    }

    func titleFor(_ i: Int) -> String {
        guard i > -1 && i < numberOfExamples else {
            return ""
        }

        return exampleItems[i].title
    }

    func navigateTo(_ i: Int) {
        guard i > -1 && i < numberOfExamples else {
            return
        }

        exampleItems[i].router?.navigate()
    }
}
