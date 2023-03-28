//
//  CustomDailyWheatherCollectionViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 24.03.2023.
//

import UIKit

class CustomDailyWheatherCollectionViewCell: UICollectionViewCell {

    private lazy var view = CVView(backgroundColor: .accentBlue)
    private lazy var titleLabel = CVLabel(text: "16/04 ПТ", size: 18, weight: .regular, color: .textBlack, tag: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.tag = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
