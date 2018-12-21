//
//  HomeView.swift
//  iOSExample
//
//  Created by Kamil Wyszomierski on 14/12/2018.
//  Copyright © 2018 HL Tech. All rights reserved.
//

import UIKit

class HomeView: UIView {

    // MARK: - Parameters

    let homeLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        clipsToBounds = true
        homeLabel.text = "Home scene"
        homeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(homeLabel)

        setNeedsUpdateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Updates

    override func updateConstraints() {
        NSLayoutConstraint.activate([
            homeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

        super.updateConstraints()
    }
}
