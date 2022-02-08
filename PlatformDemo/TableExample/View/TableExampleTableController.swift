//
//  TableController.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 22.09.2021.
//

import UIKit

final class TableExampleTableController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var strings: [String] = []

    private let hCell = TableExampleCell(frame: .zero)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        strings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableExampleCell.self)",
                                                       for: indexPath) as? TableExampleCell else {
            return UITableViewCell()
        }

        cell.label.text = strings[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        hCell.label.text = strings[indexPath.row]
        hCell.layoutSubviews()

        return hCell.intrinsicContentSize.height
    }
}
