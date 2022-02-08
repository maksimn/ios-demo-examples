//
//  TableExampleViewController.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 17.09.2021.
//

import UIKit

class TableExampleViewController: UIViewController {

    let tableView = UITableView()
    let tableController = TableExampleTableController()

    let model: TableExampleModel

    init(model: TableExampleModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        initViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableController.strings = model.strings
        tableView.reloadData()
    }
}
