//
//  NutritionCellTableViewCell.swift
//  LifeSumPlus
//
//  Created by Clement on 5/25/16.
//  Copyright © 2016 Clement. All rights reserved.
//

import UIKit

class NutritionCell: UITableViewCell {

    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
