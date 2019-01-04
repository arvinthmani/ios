//
//  ViewController.swift
//  sampleFirstApp
//
//  Created by Arvinth  on 26/12/18.
//  Copyright © 2018 Arvinth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var mealLabel: UILabel!
  @IBOutlet weak var mealRatingLabel: UILabel!
  var mealName: Meal!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    mealLabel.text = mealName.name
    mealRatingLabel.text = mealName.rating
    // Do any additional setup after loading the view, typically from a nib.
  }


}

