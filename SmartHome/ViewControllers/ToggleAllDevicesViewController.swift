//
//  ToggleAllDevicesViewController.swift
//  SmartHome
//
//  Created by Andrew H on 5/19/22.
//

import UIKit

//MARK: global property
let TurnOnAllNotificationName = Notification.Name(rawValue: "TurnOnAllDevicesNotification")
let TurnAllOffNotificationName = Notification.Name(rawValue: "TurnOffAllDevicesNotification")

class ToggleAllDevicesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func turnAllOnButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: TurnOnAllNotificationName, object: nil)
    }
    
    @IBAction func turnAllOffButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: TurnAllOffNotificationName, object: nil)
    }
}
