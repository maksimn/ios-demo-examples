//
//  MyTableView.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 24.09.2021.
//

import UIKit

class MyTableView: UITableView {

    var calculated: Bool = false

    override func layoutSubviews() {
        if calculated { return }

        var prevMaxY: CGFloat = 0

        for i in 0..<rowCount {
            guard let cell = cellForRow(at: IndexPath(row: i, section: 0)) as? TableCell else { continue }

            cell.frame.size = cell.intrinsicContentSize
            cell.frame.origin = CGPoint(x: 0, y: prevMaxY)
            prevMaxY += cell.frame.size.height
        }

        contentSize = CGSize(width: frame.width, height: prevMaxY)

        calculated = true
    }

    var rowCount: Int {
        dataSource?.tableView(self, numberOfRowsInSection: 0) ?? 0
    }
}
