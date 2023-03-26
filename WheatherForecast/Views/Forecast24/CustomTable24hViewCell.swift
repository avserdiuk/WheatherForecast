//
//  CustomTable24hViewCell.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 23.03.2023.
//

import UIKit

class CustomTable24hViewCell: UITableViewCell {

    private lazy var wrapperView = CVView()

    private lazy var mainStackView = CVStackView(axis: .vertical, spacing: 8)
    private lazy var dateLabel = CVLabel(text: "пт 16/04", size: 18, weight: .semibold)
    private lazy var timeLabel = CVLabel(text: "12:00", size: 14, weight: .regular, color: .textGray)
    private lazy var degreeLabel = CVLabel(text: "13°", size: 18, weight: .semibold)

    private lazy var add1StackView = CVStackView(axis: .vertical, spacing: 15)
    private lazy var moonImageView = CVImage(imageName: "forecast24_moon")
    private lazy var windImageView = CVImage(imageName: "forecast24_wind")
    private lazy var rainImageView = CVImage(imageName: "forecast24_rain")
    private lazy var cloudImageView = CVImage(imageName: "forecast24_cloud")

    private lazy var add2StackView = CVStackView(axis: .vertical, spacing: 9)
    private lazy var add1Label = CVLabel(text: "Преимущественно", size: 14, weight: .regular)
    private lazy var add2Label = CVLabel(text: "Ветер", size: 14, weight: .regular)
    private lazy var add3Label = CVLabel(text: "Атмосферные осадки", size: 14, weight: .regular)
    private lazy var add4Label = CVLabel(text: "Облачность", size: 14, weight: .regular)

    private lazy var add3StackView = CVStackView(axis: .vertical, spacing: 9, alignment: .trailing)
    private lazy var add11Label = CVLabel(text: "10", size: 14, weight: .regular, color: .textGray)
    private lazy var add22Label = CVLabel(text: "2 м/с ССЗ", size: 14, weight: .regular, color: .textGray)
    private lazy var add33Label = CVLabel(text: "0%", size: 14, weight: .regular, color: .textGray)
    private lazy var add44Label = CVLabel(text: "29%", size: 14, weight: .regular, color: .textGray)

    private lazy var hrView = CVView(backgroundColor: .accentBlue)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = Colors.backgroundWhite.color

        setViews()
        setConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setViews(){
        addSubview(wrapperView)
        wrapperView.addSubview(mainStackView)
            mainStackView.addArrangedSubview(dateLabel)
            mainStackView.addArrangedSubview(timeLabel)
            mainStackView.addArrangedSubview(degreeLabel)
        wrapperView.addSubview(add1StackView)
            add1StackView.addArrangedSubview(moonImageView)
            add1StackView.addArrangedSubview(windImageView)
            add1StackView.addArrangedSubview(rainImageView)
            add1StackView.addArrangedSubview(cloudImageView)
        wrapperView.addSubview(add2StackView)
            add2StackView.addArrangedSubview(add1Label)
            add2StackView.addArrangedSubview(add2Label)
            add2StackView.addArrangedSubview(add3Label)
            add2StackView.addArrangedSubview(add4Label)
        wrapperView.addSubview(add3StackView)
            add3StackView.addArrangedSubview(add11Label)
            add3StackView.addArrangedSubview(add22Label)
            add3StackView.addArrangedSubview(add33Label)
            add3StackView.addArrangedSubview(add44Label)
        wrapperView.addSubview(hrView)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            wrapperView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            wrapperView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            wrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            mainStackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 0),
            mainStackView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -64),

            dateLabel.heightAnchor.constraint(equalToConstant: 22),
            timeLabel.heightAnchor.constraint(equalToConstant: 19),

            add1StackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 33),
            add1StackView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 88),

            add2StackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 33),
            add2StackView.leftAnchor.constraint(equalTo: add1StackView.rightAnchor, constant: 10),

            add3StackView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 33),
            add3StackView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: 0),

            hrView.heightAnchor.constraint(equalToConstant: 0.7),
            hrView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: 0),
            hrView.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 0),
            hrView.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: 0),

        ])
    }
}
