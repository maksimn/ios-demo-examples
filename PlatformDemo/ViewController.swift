//
//  ViewController.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 17.09.2021.
//

import UIKit

class ViewController: UIViewController {

    let tableView = MyTableView()
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
        view.backgroundColor = .yellow
    }

    func initViews() {
        view.backgroundColor = .yellow
        addSubviews()
        initTableView()
    }

    func addSubviews() {
        view.addSubview(tableView)
    }

    func initTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 16
        tableView.register(TableCell.self, forCellReuseIdentifier: "\(TableCell.self)")
        tableView.dataSource = tableController
        tableView.delegate = tableController
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))

        tableController.strings = tableData.strings
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.frame = CGRect(x: 10, y: 100,
                                 width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 100)
    }
}
