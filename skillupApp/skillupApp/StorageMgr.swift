//
//  StorageMgr.swift
//  skillupApp
//
//  Created by Arvinth on 15/11/19.
//  Copyright © 2019 Arvinth. All rights reserved.
//

import Foundation

class StorageMgr: NSObject {

    let defaults = UserDefaults.standard
    var osArray: [DataModel]?
    override init() {
        super.init()
        if defaults.value(forKey:"OS") == nil {
          osArray  = [(DataModel(section: 1, id: 1, name: "iOS")),
                       (DataModel(section: 1, id: 2, name: "Watch OS")),
                       (DataModel(section: 1, id: 3, name: "Mac OS"))]
            defaults.set(try? PropertyListEncoder().encode(osArray), forKey:"OS")
        } else {
            osArray = getData()
        }
    }
    
    func getData() -> [DataModel] {
        if let data = defaults.value(forKey:"OS") as? Data {
            guard let OS = try? PropertyListDecoder().decode(Array<DataModel>.self, from: data) as [DataModel] else { return [] }
            
             return OS
        }
       return []
    }
    
    func addData(_ newOS: DataModel) {
        osArray?.append(newOS)
        defaults.set(try? PropertyListEncoder().encode(osArray), forKey:"OS")
    }
}
