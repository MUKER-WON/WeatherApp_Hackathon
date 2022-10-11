//
//  SideMenuViewController.swift
//  WeatherApp_Hackathon
//
//  Created by Muker on 2022/10/11.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    let searchController = UISearchController()
    let sideTable = UITableView()
    let tableCell = UITableViewCell()
    
    let sideButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    let areaName = ["서울","부산","대전","전주","제주도","창원","인천","김포","일산","광주","구리","마산","대구"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setAutoLayout()
        setSearchBar()
        
        
        
    }
    
    //MARK: - setUp
    func setUp() {
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "blue_sky")!)
        
        view.addSubview(sideTable)
        view.addSubview(sideButton)
        
    }
    
    
    //MARK: - setUI
    func setAutoLayout() {
        sideTable.translatesAutoresizingMaskIntoConstraints = false
        
        sideTable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        sideTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        sideTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
        sideTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        sideTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        sideTable.backgroundColor = .clear

        
        sideTable.register(UINib(nibName: "SideTableViewCell", bundle: nil), forCellReuseIdentifier: "SideTableViewCell")
        sideTable.dataSource = self
        sideTable.delegate = self
        //sideTable.rowHeight = 80
        sideTable.backgroundColor = .clear
        sideTable.alpha = 0.6
     
        sideButton.translatesAutoresizingMaskIntoConstraints = false
        sideButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        sideButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        sideButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        sideButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        sideButton.layer.backgroundColor = UIColor.systemGray2.cgColor
        sideButton.layer.cornerRadius = 10
        sideButton.layer.borderWidth = 2
        sideButton.layer.borderColor = UIColor.systemGray4.cgColor
        
    }
    
    func setSearchBar() {
        
        searchController.searchBar.delegate = self
        searchController.searchBar.autocorrectionType = .no
        
        let searchBar = searchController.searchBar
        
        searchBar.sizeToFit()
        searchBar.placeholder = "지역 검색"
        searchBar.backgroundColor = .clear
        searchBar.barTintColor = UIColor.white
        searchBar.isTranslucent = true
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        
        searchBar.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.view.addSubview(searchBar)
    }
    
    
    @objc func backButtonTapped() {
        
        dismiss(animated: true)
        
    }
}

extension SideMenuViewController: UISearchBarDelegate {
    
}

extension SideMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return areaName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SideTableViewCell", for: indexPath) as! SideTableViewCell
        cell.alpha = 0.1
        
        
        cell.sideLabel.text = areaName[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
}

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}

extension SideMenuViewController: UITextViewDelegate {
    
}
