//
//  viewModel.swift
//  skillupApp
//
//  Created by Arvinth on 14/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import UIKit

class ViewModel: NSObject  {
    
    var osArray: [DataModel]?

    override init() {
        super.init()
        osArray = StorageMgr().getData()
    }
    
    func getOSList() -> [DataModel] {
        return osArray!
    }
}
