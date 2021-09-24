//
//  MyTableView.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 24.09.2021.
//

import UIKit

class MyTableView: UITableView {

    var yOffsets: [CGFloat] = []
    var totalHeight: CGFloat = .zero

    override func layoutSubviews() {
        if yOffsets.count == 0 {
            yOffsets = Array(repeating: .zero, count: rowCount + 1)
        }

        let paths = indexPathsForVisibleRows ?? []
        let start = paths.first?.row ?? -1
        let end = paths.last?.row ?? -1

        for i in start...end {
            guard let cell = cellForRow(at: IndexPath(row: i, section: 0)) as? TableCell else { continue }

            let height = cell.intrinsicContentSize.height

            cell.frame.size = CGSize(width: frame.width, height: height)
            cell.frame.origin = CGPoint(x: 0, y: yOffsets[i] - contentOffset.y)

            if yOffsets[i + 1].isZero {
                yOffsets[i + 1] = yOffsets[i] + cell.frame.size.height
                totalHeight = max(totalHeight, yOffsets[i + 1])
            }
        }

        contentSize = CGSize(width: frame.width, height: totalHeight - contentOffset.y)
    }

    var rowCount: Int {
        dataSource?.tableView(self, numberOfRowsInSection: 0) ?? 0
    }
}
