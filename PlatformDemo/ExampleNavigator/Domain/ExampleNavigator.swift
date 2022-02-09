//
//  ExampleNavigator.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

protocol ExampleNavigator {

    var numberOfExamples: Int { get }

    func titleFor(_ i: Int) -> String

    func navigateTo(_ i: Int)
}
