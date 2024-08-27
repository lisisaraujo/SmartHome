//
//  ListItemView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 27.08.24.
//

import SwiftUI

struct ListItemView: View {
    let device: SmartDevice
    
    var body: some View {
        HStack {
            Image(systemName: device.type.iconName)
            Text(device.name)
            Spacer()
            Text(device.type.rawValue)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(20)
    }
}


#Preview {
    ListItemView(device: SmartDevice(name: "Living room light", type: .light))
}
