//
//  PageViewController.swift
//  WeatherApp_Hackathon
//
//  Created by Muker on 2022/10/07.
//

import UIKit
import CoreLocation

class PageViewController: UIPageViewController {
    
    static var pages = [UIViewController]()
    
    var pageControl = UIPageControl()
    
    let locationManager = CLLocationManager()
    
    var currentIndex = 0 {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        makePageControl()
        locationButton()
        tableButton()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
    private func locationButton() {
        
        let button = UIButton()
        
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(locationPressed), for: .touchUpInside) // 버튼 타겟 연결
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30).isActive = true
        button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func tableButton() {
        
        let button = UIButton()
        
        button.setBackgroundImage(UIImage(systemName: "list.dash"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        
        view.addSubview(button)
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -15).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(listPressed), for: .touchUpInside) // 버튼 타겟 연결
        
    }
    
    @objc func listPressed() {
        let VC = SideMenuViewController()
        
        VC.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {
            if let sheet = VC.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
        } else {
            
        }
        
        
        present(VC, animated: true)
        
    }
    
    func setUI() {
        
        let itemVC1 = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
        itemVC1.areaName = "서울"
        itemVC1.weatherIamge = UIImage(systemName: "cloud.sun.fill")
        itemVC1.temp = 25
        itemVC1.weaterDescription = "한 때 흐림"
        itemVC1.maxTemp = 28
        itemVC1.minTemp = 23
        itemVC1.background = UIImage(named: "seoul")
        
        let itemVC2 = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
        itemVC2.areaName = "부산"
        itemVC2.weatherIamge = UIImage(systemName: "cloud.rain.fill")
        itemVC2.temp = 20
        itemVC2.weaterDescription = "흐린 뒤 비"
        itemVC2.maxTemp = 25
        itemVC2.minTemp = 19
        itemVC2.background = UIImage(named: "busan")
        
        
        let itemVC3 = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
        itemVC3.areaName = "대전"
        itemVC3.weatherIamge = UIImage(systemName: "cloud.fill")
        itemVC3.temp = 23
        itemVC3.weaterDescription = "대체로 흐림"
        itemVC3.maxTemp = 25
        itemVC3.minTemp = 19
        itemVC3.background = UIImage(named: "daejeon")
        
        
        let itemVC4 = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
        itemVC4.areaName = "전주"
        itemVC4.weatherIamge = UIImage(systemName: "sun.max.fill")
        itemVC4.temp = 28
        itemVC4.weaterDescription = "맑음"
        itemVC4.maxTemp = 29
        itemVC4.minTemp = 24
        itemVC4.background = UIImage(named: "jeonju")
        
        let itemVC5 = WeatherViewController(nibName: "WeatherViewController", bundle: nil)
        itemVC4.areaName = "전주"
        itemVC4.weatherIamge = UIImage(systemName: "sun.max.fill")
        itemVC4.temp = 28
        itemVC4.weaterDescription = "맑음"
        itemVC4.maxTemp = 29
        itemVC4.minTemp = 24
        itemVC4.background = UIImage(named: "jeonju")
        
        PageViewController.pages.append(itemVC1)
        PageViewController.pages.append(itemVC2)
        PageViewController.pages.append(itemVC3)
        PageViewController.pages.append(itemVC4)
        
        setViewControllers([itemVC1], direction: .forward, animated: true)
        
        self.dataSource = self
        
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = PageViewController.pages.count
        pageControl.currentPage = 0
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([PageViewController.pages[sender.currentPage]], direction: .forward, animated: true)
        } else {
            self.setViewControllers([PageViewController.pages[sender.currentPage]], direction: .reverse, animated: true)
        }
        
        self.currentIndex = sender.currentPage
        
    }
    
}

//MARK: - ExtensionPageViewDataSource

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = PageViewController.pages.firstIndex(of: viewController) else { return nil }
        
        self.currentIndex = currentIndex
        if currentIndex == 0 {
            return PageViewController.pages.last
        } else {
            return PageViewController.pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = PageViewController.pages.firstIndex(of: viewController) else { return nil}
        
        self.currentIndex = currentIndex
        if currentIndex == PageViewController.pages.count - 1 {
            return PageViewController.pages.first
        } else {
            return PageViewController.pages[currentIndex + 1]
        }
        
    }
    
}

//MARK: - Extension
extension PageViewController: CLLocationManagerDelegate {
    
    @objc func locationPressed() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    

}
