//
//  ViewController.swift
//  skillupApp
//
//  Created by Arvinth on 14/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        print("loadview")
        tableView = ViewModel().getTableView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
    }
    
    
    // MARK: Tableview func
    
}



