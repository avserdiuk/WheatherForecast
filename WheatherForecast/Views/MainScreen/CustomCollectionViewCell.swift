//
//  CustomCollectionViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    private lazy var stackView = CVStackView(axis: .vertical, spacing: 5, alignment: .center)

    private lazy var timeLabel = CVLabel(text: "12:00", size: 14, weight: .regular, numberOfLines: 1)
    private lazy var imageView = CVImage(imageName: "sun24h")
    private lazy var degreeLabel = CVLabel(text: "23", size: 16, weight: .regular)

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = Colors.borderBlue.color.cgColor
        contentView.layer.cornerRadius = 22

        setViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setViews(){
        addSubview(stackView)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(degreeLabel)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),

            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            imageView.heightAnchor.constraint(equalToConstant: 16),

        ])
    }
}
