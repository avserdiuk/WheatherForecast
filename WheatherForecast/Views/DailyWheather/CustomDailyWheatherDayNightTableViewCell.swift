//
//  CustomDailyWheatherDayNightTableViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 25.03.2023.
//

import UIKit

class CustomDailyWheatherDayNightTableViewCell: UITableViewCell {

    private lazy var wrapperView = CVView(backgroundColor: .backgroundWhite, cornerRadius: 5)
    private lazy var titleLabel = CVLabel(text: "Солнце и луна", size: 18, weight: .semibold)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(wrapperView)
        wrapperView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            wrapperView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            wrapperView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            wrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),

            titleLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 21),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
