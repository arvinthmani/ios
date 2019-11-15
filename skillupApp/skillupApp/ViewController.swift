//
//  ViewController.swift
//  skillupApp
//
//  Created by Arvinth on 14/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    let viewModel = ViewModel()

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Tableview func
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getData().count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO:
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell")
        cell?.textLabel?.text = viewModel.getData()[indexPath.row].name
            
        return cell!
    }

    
}



