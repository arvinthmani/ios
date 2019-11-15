//
//  secondViewController.swift
//  skillupApp
//
//  Created by Arvinth on 15/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    let secViewModel = SecViewModel()

    @IBOutlet weak var txtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        secViewModel.addOSToList(newOS: DataModel(section: 1, id: 4, name: txtFld.text ?? ""))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
