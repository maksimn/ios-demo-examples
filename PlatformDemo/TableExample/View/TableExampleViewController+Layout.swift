//
//  ViewController+Layout.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 25.09.2021.
//

import UIKit

extension TableExampleViewController {

    func initViews() {
        view.backgroundColor = .yellow
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 16
        tableView.register(TableExampleCell.self, forCellReuseIdentifier: "\(TableExampleCell.self)")
        tableView.dataSource = tableController
        tableView.delegate = tableController
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.frame = CGRect(x: 10, y: 100,
                                 width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 100)
    }
}
