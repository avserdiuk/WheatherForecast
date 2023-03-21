//
//  CustomCollectionViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    private lazy var image = CVImage(imageName: "cell")

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            image.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
