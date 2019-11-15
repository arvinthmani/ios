//
//  SecViewModel.swift
//  skillupApp
//
//  Created by Arvinth on 15/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import Foundation

class SecViewModel: NSObject {
    override init() {
        super.init()
    }
    
    func addOSToList(newOS: DataModel) {
        StorageMgr().addData(newOS)
    }
}
