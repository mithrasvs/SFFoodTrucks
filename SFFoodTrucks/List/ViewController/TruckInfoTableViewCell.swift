//
//  TruckInfoTableViewCell.swift
//  SFFoodTrucks
//
//  Created by Singam, Venkata Srinath Mith on 7/2/19.
//  Copyright © 2019 Mithra Singam. All rights reserved.
//

import UIKit

class TruckInfoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var truckNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var truckSpecialities: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
