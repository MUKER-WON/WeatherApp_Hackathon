//
//  SideTableViewCell.swift
//  WeatherApp_Hackathon
//
//  Created by Muker on 2022/10/11.
//

import UIKit

class SideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var sideLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
          super.layoutSubviews()
//          let bottomSpace: CGFloat = 10.0 // Let's assume the space you want is 10
//          self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
     }
    

}
