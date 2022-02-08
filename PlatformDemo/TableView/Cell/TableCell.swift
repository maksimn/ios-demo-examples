//
//  TableCell.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 22.09.2021.
//

import UIKit

class TableCell: UITableViewCell {

    let label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
