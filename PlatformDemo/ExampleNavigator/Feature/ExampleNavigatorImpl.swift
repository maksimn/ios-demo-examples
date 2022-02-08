//
//  ExampleNavigatorImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

final class ExampleNavigatorImpl: ExampleNavigator {

    private let items: [ExampleNavigatorItem]

    init(items: [ExampleNavigatorItem]) {
        self.items = items
    }

    var numberOfExamples: Int {
        items.count
    }

    func titleFor(_ i: Int) -> String {
        guard i > -1 && i < numberOfExamples else { return "" }

        return items[i].title
    }

    func navigateTo(_ i: Int) {
        guard i > -1 && i < numberOfExamples else { return }

        items[i].router?.navigate()
    }
}
