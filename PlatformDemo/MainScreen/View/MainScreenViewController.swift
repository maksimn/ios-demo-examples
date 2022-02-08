//
//  MainScreenViewController.swift
//  PlatformDemo
//
//  Created by Maksim Ivanov on 08.02.2022.
//

import UIKit

final class MainScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let exampleNavigatorBuilder: ExampleNavigatorBuilder
    private lazy var exampleNavigator = exampleNavigatorBuilder.build()

    private let tableView = UITableView()

    init(exampleNavigatorBuilder: ExampleNavigatorBuilder) {
        self.exampleNavigatorBuilder = exampleNavigatorBuilder
        super.init(nibName: nil, bundle: nil)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? exampleNavigator.numberOfExamples : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)",
                                                 for: indexPath)
        var content = cell.defaultContentConfiguration()

        content.text = exampleNavigator.titleFor(indexPath.row)
        cell.contentConfiguration = content
        cell.selectionStyle = .none

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        exampleNavigator.navigateTo(indexPath.row)
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
