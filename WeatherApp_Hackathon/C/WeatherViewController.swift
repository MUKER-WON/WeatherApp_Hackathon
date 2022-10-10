//
//  WeatherViewController.swift
//  WeatherApp_Hackathon
//
//  Created by Muker on 2022/10/07.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var _minTempLabel: UILabel!
    @IBOutlet private weak var _maxTempLabel: UILabel!
    @IBOutlet private weak var _descriptionLabel: UILabel!
    @IBOutlet private weak var _tempLabel: UILabel!
    @IBOutlet private weak var _weatherIIamgeView: UIImageView!
    @IBOutlet private weak var _areaNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewBlurEffect: UIVisualEffectView!
    var minTemp: Int = .zero
    var maxTemp: Int = .zero
    var weaterDescription: String = ""
    var temp: Int = .zero
    var weatherIamge: UIImage?
    var areaName: String = ""
    var background: UIImage?
    var weekArray: [Weekend] = [
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "오늘", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°"),
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "내일", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°"),
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "금", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°"),
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "토", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°"),
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "일", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°"),
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "월", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°"),
        Weekend(weekWeatherImage: UIImage(named: "cloud"), weekName: "화", weekRain: "70%", weekMax: "최고: 20°", weekMin: "최소: 15°")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
        _areaNameLabel.text = areaName
        _weatherIIamgeView.image = weatherIamge
        _tempLabel.text = "\(temp)°"
        _descriptionLabel.text = weaterDescription
        _maxTempLabel.text = "최고 온도: \(maxTemp)°"
        _minTempLabel.text = "최저 온도: \(minTemp)°"
        
        tableView.register(UINib(nibName: "WeekendCell", bundle: nil), forCellReuseIdentifier: "WeekCell")
        
        tableView.dataSource = self
        tableView.rowHeight = 50
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    func assignbackground() {
        
        let background = self.background

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        
    }
}



extension WeatherViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeekCell", for: indexPath) as! WeekendCell
        
        let weather = weekArray[indexPath.row]
        
        cell.weekImage.image = weather.weekWeatherImage
        cell.weekNameLabel.text = weather.weekName
        cell.weekMaxLabel.text = weather.weekMax
        cell.weekMinLabel.text = weather.weekMin
        cell.weekRainLabel.text = weather.weekRain
        
        
        return cell
    }
    
    
    
    
    
    
    
}
