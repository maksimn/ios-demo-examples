//
//  code.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 17.09.2021.
//

import UIKit

class SomeClass {

    var prop: Int = 0 {
        willSet {

        }
        didSet {

        }
    }
}


class SomeViewController: UIViewController {

}


class SomeView: UIView {

    init() {
        super.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func someFunc() {
    let someViewController = SomeViewController()

    someViewController.viewWillLayoutSubviews()
}
