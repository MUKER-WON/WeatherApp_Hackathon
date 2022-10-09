//
//  PageViewController.swift
//  WeatherApp_Hackathon
//
//  Created by Muker on 2022/10/07.
//

import UIKit
import CoreLocation

final class PageViewController: UIPageViewController {
    
    var pages = [UIViewController]()
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
    }
    
    private func locationButton() {
        
        let button = UIButton()
        
        button.setBackgroundImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .systemBlue
        
        view.addSubview(button)
        
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
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        pages.append(itemVC4)
        
        setViewControllers([itemVC1], direction: .forward, animated: true)
        
        self.dataSource = self
        
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true)
        }
        
        self.currentIndex = sender.currentPage
        
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        self.currentIndex = currentIndex
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil}
        
        self.currentIndex = currentIndex
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
        
    }
    
}
