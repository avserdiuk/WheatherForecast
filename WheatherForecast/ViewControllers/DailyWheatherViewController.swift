//
//  DailyWheatherViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 24.03.2023.
//

import UIKit

class DailyWheatherViewController: UIViewController {

    var wheather : Wheather?
    var index : Int = 0

    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()

    private lazy var backButtonTitleLabel = CVButton(title: dailyWheatherBackButtonTitleLabel, titleSize: 16, titleColor: .textGray)
    private lazy var titleLabel = CVLabel(text: "Омск, Россия", size: 18, weight: .semibold)

    lazy var tableView : UITableView = {
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

        setViews()
        setConstraints()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    func setViews(){
        view.addSubview(backButton)
        view.addSubview(backButtonTitleLabel)
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }

    func setConstraints(){
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
        guard let wheather else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            let cell = CustomDailyWheatherTableViewCell()
            cell.setup("День", wheather.forecasts[index].parts.day, indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = CustomDailyWheatherTableViewCell()
            cell.setup("Ночь", wheather.forecasts[index].parts.night, indexPath)
            return cell
        } else if indexPath.row == 2 {
            let cell = CustomDailyWheatherDayNightTableViewCell()
            cell.setup(wheather.forecasts[index])
            return cell
        } else {
            return CustomDailyWheatherAirQualityTableViewCell()
        }
    }
}

extension DailyWheatherViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CustomDailyWheatherTableHeader()
        header.wheather = wheather
        header.index = index
        header.delegate = self
        return header
    }
}
