//
//  MainScreenViewController.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

struct MainScreenViewParams {

    let exampleTitles: [String]
}

final class MainScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let params: MainScreenViewParams
    private let router: MainScreenRouter

    private let tableView = UITableView()

    init(params: MainScreenViewParams, router: MainScreenRouter) {
        self.params = params
        self.router = router
        super.init(nibName: nil, bundle: nil)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)",
                                                 for: indexPath)
        var content = cell.defaultContentConfiguration()

        if !params.exampleTitles.isEmpty {
            content.text = params.exampleTitles[0]
            cell.contentConfiguration = content
            cell.selectionStyle = .none
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            router.navigateToTableExample()
        }
    }

    private func initViews() {
        view.backgroundColor = .green
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 46
    }
}
