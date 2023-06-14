//
//  PageViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit
import CoreLocation

class PageViewController: UIViewController {

    var locations : [String] = UserDefaults.standard.object(forKey: "Locations") as? [String] ?? []
    var wheathers : [Wheather] = []

    lazy var controllers : [UIViewController] = {
        var controllers : [UIViewController] = []
        self.wheathers.enumerated().forEach {
            self.controllers.append(WheatherViewController(wheather: $1, viewController: self, titleLabel: self.locations[$0]))
        }
        return controllers
    }()

    private lazy var wrapperView = CVView(backgroundColor: .textBlack, isHidden: true, alpha: 0.5)

    private lazy var pageViewController : UIPageViewController = {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        controller.dataSource = self
        controller.delegate = self
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        return controller
    }()

    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = self.locations.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.isHidden = true
        return pageControl
    }()

    private lazy var activityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    private lazy var informationLabel = CVLabel(text: pageDescription, size: 16, weight: .semibold, color: Colors.textGray, numberOfLines: 0, textAlignment: .center, isHidden: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setNavigationBar()
        setViews()
        setConstraints()

        if locations.isEmpty {
            activityIndicator.stopAnimating()
            informationLabel.isHidden = false
        } else {
            showWheather()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func showWheather(){
        self.activityIndicator.startAnimating()

        let myGroup = DispatchGroup()

        wheathers = []
        locations.forEach {
            myGroup.enter()
            NetworkManager().getCoordsWithString($0) { desc, coords in
                NetworkManager().getWheater(coordinates: coords) { wheather in
                    DispatchQueue.main.async {
                        self.wheathers.append(wheather)
                        myGroup.leave()
                    }
                }
            }
        }

        myGroup.notify(queue: .main) {
            self.pageControl.isHidden = false
            self.activityIndicator.stopAnimating()

            self.controllers = []
            self.wheathers.enumerated().forEach {
                self.controllers.append(WheatherViewController(wheather: $1, viewController: self, titleLabel: self.locations[$0]))
            }

            self.pageViewController.setViewControllers([self.controllers[self.controllers.count-1]], direction: .forward, animated: true)

            self.title = self.locations[self.controllers.count-1]

            self.pageControl.numberOfPages = self.locations.count
            self.pageControl.currentPage = self.locations.count
            
        }
    }

    func setNavigationBar(){

        let menu = UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(showMenu))
        let point = UIBarButtonItem(image: UIImage(named: "point"), style: .done, target: self, action: #selector(showAlert))
        navigationItem.leftBarButtonItems = [menu]
        navigationItem.rightBarButtonItems = [point]
        navigationController?.navigationBar.tintColor = .black

    }

    func setViews(){
        view.addSubview(informationLabel)
        view.addSubview(activityIndicator)
        view.addSubview(pageControl)
        view.addSubview(pageViewController.view)
        view.addSubview(wrapperView)

    }

    func setConstraints(){
        NSLayoutConstraint.activate([

            wrapperView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            wrapperView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            wrapperView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            wrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),

            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),

            pageViewController.view.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 10),
            pageViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            pageViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),

            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            informationLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            informationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            informationLabel.widthAnchor.constraint(equalToConstant: 250),

        ])
    }

    @objc func showMenu(){
        let controller = SettingViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func showAlert(){
        wrapperView.isHidden = false

        let alert = UIAlertController(title: "Добавить новый город", message: "например \"Омск\"", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
            textField.placeholder = "Введите ваш город:"
        }

        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            guard let city = textField?.text else { return }

            NetworkManager().getCoordsWithString(city) { desc, coords in
                self.locations.append(desc)
                UserDefaults.standard.set(self.locations, forKey: "Locations")

                DispatchQueue.main.async {
                    self.informationLabel.isHidden = true
                    self.wrapperView.isHidden = true
                    self.viewDidLoad()
                }
            }

        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
            self.wrapperView.isHidden = true
        }))

        self.present(alert, animated: true, completion: nil)
    }

}

extension PageViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewController = viewController as? WheatherViewController else {return nil}
        if let index = controllers.firstIndex(of: viewController) {
            if index > 0 {
                return controllers[index-1]
            }
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let viewController = viewController as? WheatherViewController else {return nil}
        if let index = controllers.firstIndex(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index+1]
            }
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if let index = controllers.firstIndex(of: pendingViewControllers[0]){
            self.title = locations[index]
            self.pageControl.currentPage = index

        }
    }
}
