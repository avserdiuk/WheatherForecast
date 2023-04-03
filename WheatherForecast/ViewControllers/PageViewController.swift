//
//  PageViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit
import CoreLocation

class PageViewController: UIViewController {

    var number : Int = 3
    var currentNumber : Int = 1

    var currentCity = UserDefaults.standard.string(forKey: "CurrentCity")
    var currentCoords : [Double]? = UserDefaults.standard.object(forKey: "CurrentCoords") as? [Double]

    private lazy var locationManager : CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
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
        pageControl.numberOfPages = 2
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

        if let currentCoords {
            findUser(with: currentCoords)
        } else if let currentCity {
            findUser(with: currentCity)
        } else {
            activityIndicator.stopAnimating()
            informationLabel.isHidden = false
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        locationManager.requestLocation()
    }

    func findUser(with currentCity : String) {
        getWheather(currentCity)
    }

    func findUser(with currentCoords : [Double]){

        let x = currentCoords[1]
        let y = currentCoords[0]

        NetworkManager().getDescriptionWithCoords((x,y)) { desc in
            UserDefaults.standard.set("\(desc)", forKey: "CurrentCity") // костылёк (=
            NetworkManager().getWheater(coordinates: (y,x)) { wheather in
                DispatchQueue.main.async {
                    self.title = desc

                    let controller = MainViewController()
                    controller.viewController = self
                    controller.wheather = wheather

                    self.pageViewController.setViewControllers([controller], direction: .forward, animated: true)
                    self.pageControl.isHidden = false
                    self.activityIndicator.stopAnimating()
                }
            }
        }

    }

    func getWheather(_ city: String){
        NetworkManager().getCoordsWithString(city) { desc, coords in
            NetworkManager().getWheater(coordinates: coords) { wheather in
                DispatchQueue.main.async {
                    self.title = desc

                    let controller = MainViewController()
                    controller.viewController = self
                    controller.wheather = wheather

                    self.pageViewController.setViewControllers([controller], direction: .forward, animated: true)
                    self.pageControl.isHidden = false
                    self.activityIndicator.stopAnimating()
                }
            }
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

            UserDefaults.standard.set("\(city)", forKey: "CurrentCity")
            self.informationLabel.isHidden = true
            self.activityIndicator.startAnimating()
            self.getWheather(city)
            self.wrapperView.isHidden = true
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
            self.wrapperView.isHidden = true
        }))

        self.present(alert, animated: true, completion: nil)
    }

}

extension PageViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        nil
    }
}

extension PageViewController : UIPageViewControllerDelegate {

}

extension PageViewController : CLLocationManagerDelegate {


    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {

        if let location = locations.first {
            let lon = location.coordinate.longitude
            let lat = location.coordinate.latitude
            UserDefaults.standard.set([lon,lat], forKey: "CurrentCoords")
        } else {
            print("Не удалось получить координаты")
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
    }
}
