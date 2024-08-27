//
//  GridItemView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 27.08.24.
//

import SwiftUI

struct GridItemView: View {
    let device: SmartDevice
    
    var body: some View {
        VStack {
            Image(systemName: device.type.iconName)
                .font(.largeTitle)
            Text(device.name)
                .font(.caption)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    GridItemView(device: SmartDevice(name: "Living room light", type: .light))
}
