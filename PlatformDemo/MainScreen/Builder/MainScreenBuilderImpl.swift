//
//  MainScreenBuilderImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

final class MainScreenBuilderImpl: MainScreenBuilder {

    func build() -> MainScreenGraph {
        let viewParams = MainScreenViewParams(
            exampleTitles: ["Table view with cells with different height."]
        )
        let tableExampleBuilder = TableExampleBuilderImpl()

        return MainScreenGraphImpl(
            viewParams: viewParams,
            tableExampleBuilder: tableExampleBuilder
        )
    }
}
