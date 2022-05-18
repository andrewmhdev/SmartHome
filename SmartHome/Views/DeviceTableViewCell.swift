//
//  DeviceTableViewCell.swift
//  SmartHome
//
//  Created by Andrew H on 5/18/22.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var deviceIsOnSwitch: UISwitch!
    
    
    
    
    // helper func
    func updateViews(device: Device) {
        deviceNameLabel.text = device.name
        deviceIsOnSwitch.isOn = device.isOn
    }
    
    @IBAction func deviceToggleSwitch(_ sender: Any) {
    }
    
    
}
