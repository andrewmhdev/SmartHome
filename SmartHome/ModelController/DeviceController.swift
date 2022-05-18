//
//  DeviceController.swift
//  SmartHome
//
//  Created by Andrew H on 5/18/22.
//

import Foundation

class DeviceController {
    
    //Singleton
    static let sharedinstance = DeviceController()
    
    init() {
        loadDevices()
    }
    //SOT
    private(set) var devices: [Device] = []
    
    // computed property
    private var devicesURL: URL? {
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let url = documentDirectory.appendingPathComponent("devices.json")
        return url
    }
    //CRUD
    func createDevice(name: String) {
        let newDevice = Device(name: name)
        devices.append(newDevice)
        saveDevices()
    }
    func toggleIsOn(device: Device) {
        device.isOn.toggle()
        saveDevices()
    }
    // Persistence
    func saveDevices() {
        guard let devicesURL = devicesURL else {return}
        do {
            let data = try JSONEncoder().encode(devices)
            try data.write(to: devicesURL)
        } catch {
            print("Error saving devices", error)
        }
    }
    func loadDevices() {
        guard let devicesURL = devicesURL else {return}
            do {
                let data = try Data(contentsOf: devicesURL)
                let devices = try JSONDecoder().decode([Device].self, from: data)
                self.devices = devices
            } catch {
                print("Error loading devices", error)
            }
    }
}
