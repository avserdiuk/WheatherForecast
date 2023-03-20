//
//  PermissionViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 20.03.2023.
//

import UIKit

class PermissionViewController: UIViewController {

    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "permissionImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = permissionTitle
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = Colors.textWhite.color
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subtitle1Label : UILabel = {
        let label = UILabel()
        label.text = permissionSubtitle1
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = Colors.textWhite.color
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subtitle2Label : UILabel = {
        let label = UILabel()
        label.text = permissionSubtitle2
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = Colors.textWhite.color
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var acceptButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ УСТРОЙСТВА", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.backgroundColor = Colors.orange.color
        button.layer.cornerRadius = 10
        return button
    }()

    private lazy var declineButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.accentBlue.color

        setViews()
        setConstraints()
    }

    func setViews(){
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitle1Label)
        view.addSubview(subtitle2Label)
        view.addSubview(acceptButton)
        view.addSubview(declineButton)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 148),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 56),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 27),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -27),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            subtitle1Label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 56),
            subtitle1Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 31),
            subtitle1Label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -31),
            subtitle1Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            subtitle2Label.topAnchor.constraint(equalTo: subtitle1Label.bottomAnchor, constant: 14),
            subtitle2Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 31),
            subtitle2Label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -31),
            subtitle2Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            acceptButton.widthAnchor.constraint(equalToConstant: 340),
            acceptButton.heightAnchor.constraint(equalToConstant: 40),
            acceptButton.topAnchor.constraint(equalTo: subtitle2Label.bottomAnchor, constant: 44),
            acceptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            declineButton.widthAnchor.constraint(equalToConstant: 340),
            declineButton.heightAnchor.constraint(equalToConstant: 40),
            declineButton.topAnchor.constraint(equalTo: acceptButton.bottomAnchor, constant: 25),
            declineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
}
