//
//  TemperatureUnit.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 28.08.24.
//

import Foundation

enum TemperatureUnit: String, CaseIterable, Identifiable {
    case celsius = "°C"
    case fahrenheit = "°F"
    case kelvin = "K"
    
    var id: String { self.rawValue }
}
