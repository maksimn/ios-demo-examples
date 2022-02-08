//
//  TableCell+Layout.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 22.09.2021.
//

import UIKit

extension TableExampleCell {

    func initViews() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        selectionStyle = .none
        backgroundColor = .white
        initLabel()
    }

    private func initLabel() {
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 68
        contentView.addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(origin: CGPoint(x: 40, y: 17), size: label.intrinsicContentSize)
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: label.frame.height + 34)
    }
}

