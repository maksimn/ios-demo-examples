//
//  TableCellHeightsExampleBuilderImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class TableExampleBuilderImpl: TableExampleBuilder {

    func build() -> UIViewController {
        let model = TableExampleModelImpl()
        let viewController = TableExampleViewController(model: model)

        return viewController
    }
}
