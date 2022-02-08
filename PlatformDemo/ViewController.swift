//
//  ViewController.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 17.09.2021.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let tableController = TableController()

    let tableData = TableData()

    init() {
        super.init(nibName: nil, bundle: nil)
        initViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func onSelectRow(_ row: Int) {
    }
}

class A {

    var b: B?

    var propX: String = "" {
        didSet {
            b?.propY = propX
            print("A.propX")
        }
    }
}

class B {

    weak var a: A?

    var propY: String = "" {
        didSet {
            a?.propX = propY
            print("B.propY")
        }
    }
}
