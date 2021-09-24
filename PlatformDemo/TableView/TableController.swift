//
//  TableController.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 22.09.2021.
//

import UIKit

class TableController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var strings: [String] = []

    let cellToComputeRowHeight = TableCell(frame: .zero)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        strings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableCell.self)",
                                                       for: indexPath) as? TableCell else {
            return UITableViewCell()
        }

        cell.placeholderLabel.text = strings[indexPath.row]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        cellToComputeRowHeight.placeholderLabel.text = strings[indexPath.row]
        cellToComputeRowHeight.layoutSubviews()

        return cellToComputeRowHeight.intrinsicContentSize.height
    }
}
