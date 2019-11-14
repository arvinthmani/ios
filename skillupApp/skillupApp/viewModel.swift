//
//  viewModel.swift
//  skillupApp
//
//  Created by Arvinth on 14/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import UIKit

class ViewModel: NSObject, UITableViewDelegate, UITableViewDataSource {

    var oSArray: [DataModel] = []
    let tableView = UITableView()

    override init() {
        super.init()

        oSArray =  [(DataModel(section: 1, id: 1, name: "iOS")),
        (DataModel(section: 1, id: 2, name: "Watch OS")),
        (DataModel(section: 1, id: 3, name: "Mac OS"))]
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return oSArray.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO:
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell")
        cell?.textLabel?.text = oSArray[indexPath.row].name
            
        return cell!
    }
    
    func getTableView() -> UITableView {
        return tableView
    }
}
