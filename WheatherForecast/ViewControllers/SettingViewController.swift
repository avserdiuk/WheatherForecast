//
//  SettingViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 20.03.2023.
//

import UIKit

class SettingViewController: UIViewController {

    private lazy var cloud1ImageView = CVImage(imageName: "cloud1")
    private lazy var cloud2ImageView = CVImage(imageName: "cloud2")
    private lazy var cloud3ImageView = CVImage(imageName: "cloud3")

    private lazy var wrapperView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.914, green: 0.933, blue: 0.98, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var settingTitle = CVLabel(text: settingsTitle, size: 18, weight: .bold, color: .textBlack)

    private lazy var settingItemStack : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        return stackView
    }()

    private lazy var settingItem1Label = CVLabel(text: "Температура", size: 16, weight: .regular, color: .textGray)
    private lazy var settingItem2Label = CVLabel(text: "Скорость ветра", size: 16, weight: .regular, color: .textGray)
    private lazy var settingItem3Label = CVLabel(text: "Формат времени", size: 16, weight: .regular, color: .textGray)
    private lazy var settingItem4Label = CVLabel(text: "Уведомления", size: 16, weight: .regular, color: .textGray)

    private lazy var button = CVButton(title: "Установить", titleSize: 16, backgroundColor: .orange, cornerRadius: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.accentBlue.color

        setViews()
        setConstraints()

    }

    func setViews(){
        view.addSubview(cloud1ImageView)
        view.addSubview(cloud2ImageView)
        view.addSubview(cloud3ImageView)
        view.addSubview(wrapperView)
        wrapperView.addSubview(settingTitle)
        wrapperView.addSubview(settingItemStack)
        settingItemStack.addArrangedSubview(settingItem1Label)
        settingItemStack.addArrangedSubview(settingItem2Label)
        settingItemStack.addArrangedSubview(settingItem3Label)
        settingItemStack.addArrangedSubview(settingItem4Label)
        view.addSubview(button)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            cloud1ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            cloud1ImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            cloud1ImageView.heightAnchor.constraint(equalToConstant: 58),
            cloud1ImageView.widthAnchor.constraint(equalToConstant: 245),

            cloud2ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 121),
            cloud2ImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            cloud2ImageView.heightAnchor.constraint(equalToConstant: 94),
            cloud2ImageView.widthAnchor.constraint(equalToConstant: 182),

            cloud3ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 652),
            cloud3ImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cloud3ImageView.heightAnchor.constraint(equalToConstant: 65),
            cloud3ImageView.widthAnchor.constraint(equalToConstant: 216),

            wrapperView.widthAnchor.constraint(equalToConstant: 320),
            wrapperView.heightAnchor.constraint(equalToConstant: 330),
            wrapperView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wrapperView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            settingTitle.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 27),
            settingTitle.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 20),

            settingItemStack.topAnchor.constraint(equalTo: settingTitle.bottomAnchor, constant: 20),
            settingItemStack.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 20),

            button.topAnchor.constraint(equalTo: settingItemStack.bottomAnchor, constant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 240),

        ])
    }


}

