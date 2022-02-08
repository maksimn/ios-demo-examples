//
//  MainScreenBuilderImpl.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class MainScreenBuilderImpl: MainScreenBuilder {

    func build() -> UIViewController {
        weak var viewControllerLazy: UIViewController?

        let exampleNavigatorBuilder = ExampleNavigatorBuilderImpl(viewControllerBlock: { viewControllerLazy })
        let viewController = MainScreenViewController(exampleNavigatorBuilder: exampleNavigatorBuilder)

        viewControllerLazy = viewController
        
        return viewController
    }
}
