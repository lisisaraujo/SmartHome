//
//  File.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 27.08.24.
//

import Foundation

enum DeviceType: String, Identifiable {
    case light = "Light"
    case heating = "Heating"
    case lock = "Lock"
    case curtains = "Curtains"
    
    var id: String { self.rawValue }
}
