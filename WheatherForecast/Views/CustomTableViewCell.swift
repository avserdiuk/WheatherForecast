//
//  CustomTableViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private lazy var image = CVImage(imageName: "cell2")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
