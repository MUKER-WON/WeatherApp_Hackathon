//
//  WeekendCell.swift
//  WeatherApp_Hackathon
//
//  Created by Muker on 2022/10/08.
//

import UIKit

class WeekendCell: UITableViewCell {

    
    @IBOutlet weak var weekNameLabel: UILabel!
    
    @IBOutlet weak var weekImage: UIImageView!
    
    @IBOutlet weak var weekRainLabel: UILabel!
    
    @IBOutlet weak var weekMaxLabel: UILabel!
    
    @IBOutlet weak var weekMinLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
