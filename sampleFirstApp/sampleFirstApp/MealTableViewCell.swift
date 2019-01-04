//
//  MealTableViewCell.swift
//  sampleFirstApp
//
//  Created by Arvinth  on 26/12/18.
//  Copyright © 2018 Arvinth. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
  
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var mealRating: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
