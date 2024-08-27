//
//  SmartDevice.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 27.08.24.
//

import Foundation

struct SmartDevice: Identifiable{
    let id: UUID = UUID()
    var name: String
    var type: DeviceType
    var isOn: Bool =  false
    var temperature: Double = 20.0
    var isLocked: Bool =  true
}
