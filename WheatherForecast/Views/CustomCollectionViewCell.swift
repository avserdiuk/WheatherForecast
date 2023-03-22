//
//  CustomCollectionViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    private lazy var stackView = CVStackView(axis: .vertical, spacing: 5, alignment: .center)

    private lazy var timeLabel = CVLabel(text: "12:00", size: 14, weight: .regular)
    private lazy var imageView = CVImage(imageName: "sun24h")
    private lazy var degreeLabel = CVLabel(text: "23", size: 16, weight: .regular)

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = Colors.borderBlue.color.cgColor
        contentView.layer.cornerRadius = 22

        addSubview(stackView)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(degreeLabel)

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 3),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -3),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
