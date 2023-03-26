//
//  DailyWheatherViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 24.03.2023.
//

import UIKit

class DailyWheatherViewController: UIViewController {

    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()

    private lazy var backButtonTitleLabel = CVButton(title: "Дневная погода", titleSize: 16, titleColor: .textGray)
    private lazy var titleLabel = CVLabel(text: "Омск, Россия", size: 18, weight: .semibold)

    private lazy var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
        tableView.allowsSelection = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(backButton)
        view.addSubview(backButtonTitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(tableView)



        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),

            backButtonTitleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            backButtonTitleLabel.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 20),

            titleLabel.topAnchor.constraint(equalTo: backButtonTitleLabel.bottomAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),

        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.isNavigationBarHidden = true
    }


    @objc func didTapBackButton(){
        navigationController?.isNavigationBarHidden = false
        navigationController?.popViewController(animated: true)
    }

}

extension DailyWheatherViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 || indexPath.row == 1 {
            return CustomDailyWheatherTableViewCell()
        } else if indexPath.row == 2 {
            return CustomDailyWheatherDayNightTableViewCell()
        } else {
            return CustomDailyWheatherAirQualityTableViewCell()
        }

    }
}

extension DailyWheatherViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        CustomDailyWheatherTableHeader()
    }
}
