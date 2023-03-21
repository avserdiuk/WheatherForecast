//
//  CustomTableHeader.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit

class CustomTableHeader: UITableViewHeaderFooterView {

    private lazy var view = CVView(backgroundColor: .accentBlue)
    private lazy var elipseImageView = CVImage(imageName: "elipse")
    private lazy var sunRiseLabel = CVLabel(text: "06:00", size: 15, weight: .semibold, color: .textWhite)
    private lazy var sunSetLabel = CVLabel(text: "19:00", size: 15, weight: .semibold, color: .textWhite)

    private lazy var stackView = CVStackView(axis: .vertical, spacing: 9, alignment: .center)

    private lazy var dayNightTempLabel = CVLabel(text: "7°/13°", size: 16, weight: .regular, color: .textWhite)
    private lazy var nowTempLabel = CVLabel(text: "13°", size: 36, weight: .bold, color: .textWhite)
    private lazy var nowDescLabel = CVLabel(text: "Возможен небольшой дождь", size: 16, weight: .semibold, color: .textWhite)
    private lazy var toFix = CVLabel(text: "строка", size: 16, weight: .regular, color: .textWhite)

    private lazy var additionStackView = CVStackView(axis: .horizontal, spacing: 20)

    private lazy var sunView = CVView()
    private lazy var sunViewImageView = CVImage(imageName: "sun")
    private lazy var sunViewLabel = CVLabel(text: "0", size: 14, weight: .semibold, color: .textWhite)

    private lazy var windView = CVView()
    private lazy var windViewImageView = CVImage(imageName: "wind")
    private lazy var windViewLabel = CVLabel(text: "3 м/с", size: 14, weight: .semibold, color: .textWhite)

    private lazy var rainView = CVView()
    private lazy var rainViewImageView = CVImage(imageName: "rain")
    private lazy var rainViewLabel = CVLabel(text: "75 %", size: 14, weight: .semibold, color: .textWhite)

    private lazy var dataTimeLabel = CVLabel(text: "17:48,  пт 16 апреля", size: 16, weight: .semibold, color: .textGold)

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setViews()
        setConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setViews(){
        addSubview(view)
        view.addSubview(elipseImageView)
        view.addSubview(sunRiseLabel)
        view.addSubview(sunSetLabel)
        view.addSubview(stackView)
        stackView.addArrangedSubview(dayNightTempLabel)
        stackView.addArrangedSubview(nowTempLabel)
        stackView.addArrangedSubview(nowDescLabel)

        stackView.addArrangedSubview(additionStackView)

        sunView.addSubview(sunViewImageView)
        sunView.addSubview(sunViewLabel)
        additionStackView.addArrangedSubview(sunView)

        windView.addSubview(windViewImageView)
        windView.addSubview(windViewLabel)
        additionStackView.addArrangedSubview(windView)

        rainView.addSubview(rainViewImageView)
        rainView.addSubview(rainViewLabel)
        additionStackView.addArrangedSubview(rainView)

        stackView.addArrangedSubview(dataTimeLabel)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 212),

            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            elipseImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            elipseImageView.widthAnchor.constraint(equalToConstant: 300),
            elipseImageView.heightAnchor.constraint(equalToConstant: 246),
            elipseImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 17),

            sunRiseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            sunRiseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 167),

            sunSetLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -17),
            sunSetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 167),

            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 33),

            additionStackView.heightAnchor.constraint(equalToConstant: 20),

            sunView.heightAnchor.constraint(equalToConstant: 20),

            sunViewImageView.widthAnchor.constraint(equalToConstant: 21),
            sunViewImageView.heightAnchor.constraint(equalToConstant: 18),
            sunViewImageView.topAnchor.constraint(equalTo: sunView.topAnchor, constant: 0),
            sunViewImageView.leftAnchor.constraint(equalTo: sunView.leftAnchor, constant: 0),

            sunViewLabel.topAnchor.constraint(equalTo: sunView.topAnchor, constant: 0),
            sunViewLabel.leftAnchor.constraint(equalTo: sunViewImageView.rightAnchor, constant: 5),
            sunViewLabel.rightAnchor.constraint(equalTo: sunView.rightAnchor, constant: 0),

            windView.heightAnchor.constraint(equalToConstant: 20),

            windViewImageView.widthAnchor.constraint(equalToConstant: 25),
            windViewImageView.heightAnchor.constraint(equalToConstant: 16),
            windViewImageView.leftAnchor.constraint(equalTo: windView.leftAnchor, constant: 0),
            windViewImageView.topAnchor.constraint(equalTo: windView.topAnchor, constant: 0),

            windViewLabel.topAnchor.constraint(equalTo: windView.topAnchor, constant: 0),
            windViewLabel.leftAnchor.constraint(equalTo: windViewImageView.rightAnchor, constant: 5),
            windViewLabel.rightAnchor.constraint(equalTo: windView.rightAnchor, constant: 0),

            rainView.heightAnchor.constraint(equalToConstant: 20),

            rainViewImageView.widthAnchor.constraint(equalToConstant: 13),
            rainViewImageView.heightAnchor.constraint(equalToConstant: 15),
            rainViewImageView.leftAnchor.constraint(equalTo: rainView.leftAnchor, constant: 0),
            rainViewImageView.topAnchor.constraint(equalTo: rainView.topAnchor, constant: 0),

            rainViewLabel.topAnchor.constraint(equalTo: rainView.topAnchor, constant: 0),
            rainViewLabel.leftAnchor.constraint(equalTo: rainViewImageView.rightAnchor, constant: 5),
            rainViewLabel.rightAnchor.constraint(equalTo: rainView.rightAnchor, constant: 0)

        ])
    }
}


