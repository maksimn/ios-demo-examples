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
}
