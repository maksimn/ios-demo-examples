//
//  TableController.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 22.09.2021.
//

import UIKit

class TableController: NSObject, UITableViewDataSource, UITableViewDelegate {

    var strings: [String] = []

    let hCell = TableCell(frame: .zero)

    var onSelectRow: ((Int) -> Void)?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        strings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(TableCell.self)",
                                                       for: indexPath) as? TableCell else {
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelectRow?(indexPath.row)
    }
}
