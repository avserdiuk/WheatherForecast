//
//  PermissionViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 20.03.2023.
//

import UIKit

class PermissionViewController: UIViewController {

    private lazy var imageView = CVImage(imageName: "permissionImage")

    private lazy var titleLabel = CVLabel(
        text: permissionTitle, size: 16, weight: .bold,
        color: .textWhite,
        numberOfLines: 0,
        textAlignment: .center
    )

    private lazy var subtitle1Label = CVLabel(
        text: permissionSubtitle1, size: 14, weight: .regular,
        color: .textWhite,
        numberOfLines: 0,
        textAlignment: .center
    )

    private lazy var subtitle2Label = CVLabel(
        text: permissionSubtitle2, size: 14, weight: .regular,
        color: .textWhite,
        numberOfLines: 0,
        textAlignment: .center
    )

    private lazy var acceptButton = CVButton(
        title: permissionAcceptButtonTitle,
        titleSize: 12,
        titleColor: .textWhite,
        titleWeight: .bold,
        backgroundColor: .orange,
        cornerRadius: 10
    )

    private lazy var declineButton = CVButton(
        title: permissionDeclineButtonTitle,
        titleSize: 16,
        titleColor: .textWhite,
        titleWeight: .regular
    )

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

        acceptButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc func didTapButton(){
        let controller = Forecast24ViewController()

        navigationController?.pushViewController(controller, animated: true)
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
