//
//  Device.swift
//  SmartHome
//
//  Created by Andrew H on 5/18/22.
//

import Foundation

class Device: Codable {
    
    var name: String
    var isOn: Bool
    
    init(name: String, isOn: Bool = false) {
        self.name = name
        self.isOn = isOn
    }
 
} // end of class
