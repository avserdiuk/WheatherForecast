//
//  Forecast24ViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 23.03.2023.
//

import UIKit

class Forecast24ViewController: UIViewController {

    weak var viewController : UIViewController?
    var wheather : Wheather?
    var indexMassive : [Int] = []

    private lazy var backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()

    private lazy var backButtonTitleLabel = CVButton(title: forecast24BackButtonTitleLabel, titleSize: 16, titleColor: .textGray)
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

        setViews()
        setConstraints()
        indexMassive = getIndixesMass()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    @objc func didTapBackButton(){
        navigationController?.isNavigationBarHidden = false
        viewController?.navigationController?.popViewController(animated: true)
    }

    func getIndixesMass() -> [Int] {
        var hour = getCurrentHourAt3h()
        var hours : [Int] = []
        var index = 0

        for _ in 0...7 {
            if hour < 24 {
                hours.append(hour)
                hour += 3
            } else {
                hours.append(index)
                index += 3
            }
        }
        return hours
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
}

extension Forecast24ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let wheather else { return 0 }
        return wheather.forecasts[0].hours.count/3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomTable24hViewCell()
        if let wheather = wheather {
            cell.setup(wheather, indexPath, indexMassive)
        }
        return cell
    }
}

extension Forecast24ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = CustomTable24hHeader()
        return cell
    }
}
