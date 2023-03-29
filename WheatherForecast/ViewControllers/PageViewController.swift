//
//  PageViewController.swift
//  WheatherForecast
//
//  Created by Алексей Сердюк on 21.03.2023.
//

import UIKit

class PageViewController: UIViewController {

    var number : Int = 3
    var currentNumber : Int = 1

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
        return pageControl
    }()

    private lazy var activityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setNavigationBar()
        setViews()
        setConstraints()

        NetworkManager().getWheater { wheather in
            DispatchQueue.main.async {

                let controller = MainViewController()
                controller.viewController = self
                controller.wheather = wheather
                
                self.pageViewController.setViewControllers([controller], direction: .forward, animated: true)
                self.activityIndicator.stopAnimating()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func setNavigationBar(){
        title = "Омск, Россия"

        let menu = UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(showMenu))
        let point = UIBarButtonItem(image: UIImage(named: "point"), style: .done, target: self, action: #selector(showGeo))
        navigationItem.leftBarButtonItems = [menu]
        navigationItem.rightBarButtonItems = [point]
        navigationController?.navigationBar.tintColor = .black

    }

    func setViews(){
        view.addSubview(activityIndicator)
        view.addSubview(pageControl)
        view.addSubview(pageViewController.view)
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),

            pageViewController.view.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 10),
            pageViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            pageViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),

            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc func showMenu(){
        let controller = SettingViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func showGeo(){
        let controller = PermissionViewController()
        navigationController?.pushViewController(controller, animated: true)
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
