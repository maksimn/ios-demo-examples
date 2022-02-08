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
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
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
}
