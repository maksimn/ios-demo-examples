//
//  TableCell+Layout.swift
//  PlatformDemo
//
//  Created by Maxim Ivanov on 22.09.2021.
//

import UIKit

extension TableCell {

    func initViews() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        selectionStyle = .none
        backgroundColor = .white
        initPlacholderLabel()
    }

    private func initPlacholderLabel() {
        placeholderLabel.textColor = .gray
        placeholderLabel.font = UIFont.systemFont(ofSize: 17)
        placeholderLabel.numberOfLines = 0
        placeholderLabel.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 68
        contentView.addSubview(placeholderLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        placeholderLabel.frame = CGRect(origin: CGPoint(x: 40, y: 17), size: placeholderLabel.intrinsicContentSize)
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: placeholderLabel.frame.height + 34)
    }
}

