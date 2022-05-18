//
//  DeviceTableViewController.swift
//  SmartHome
//
//  Created by Andrew H on 5/18/22.
//

import UIKit

class DeviceTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DeviceController.sharedinstance.devices.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as? DeviceTableViewCell else {return UITableViewCell()}
        let device = DeviceController.sharedinstance.devices[indexPath.row]
        cell.updateViews(device: device)
        cell.delegate = self

        return cell
    }
    
    private func presentNewDeviceAlertController() {
        let alertController = UIAlertController(title: "New Device", message: "Enter name of device below", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "New Device Name"
        }
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Create", style: .default) { _ in
            guard let contentTextField = alertController.textFields?.first,
                  let name = contentTextField.text else {return}
            DeviceController.sharedinstance.createDevice(name: name)
            self.tableView.reloadData()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true)
    }

    // Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        presentNewDeviceAlertController()
    }
    
    
} // end of class
extension DeviceTableViewController: DeviceTableViewCellDelegate {
    func isOnSwitchToggled(_ cell: DeviceTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        let device = DeviceController.sharedinstance.devices[indexPath.row]
        DeviceController.sharedinstance.toggleIsOn(device: device)
        cell.updateViews(device: device)
    }
    
    
}






