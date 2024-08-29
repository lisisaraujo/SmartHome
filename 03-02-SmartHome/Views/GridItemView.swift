//
//  GridItemView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 27.08.24.
//

import SwiftUI

struct GridItemView: View {
    let device: SmartDevice
    let action: () -> Void
    let deleteItem: () -> Void
    
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack {
            HStack {
                if isEditing {
                    Button(action: deleteItem) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                            .imageScale(.large)
                    }
                }
                    
                Spacer()
                if device.type == .light {
                    Text(device.isOn ? "On" : "Off")
                }
                if device.type == .lock {
                    Text(device.isLocked ? "Locked" : "Open")
                        .padding(.horizontal)
                }
                
                if device.type == .heating {
                    Text("\(String(device.temperature))")
                        .padding(.horizontal)
                }
            }
            Image(systemName: device.type.iconName)
                .font(.largeTitle)
            Text(device.name)
                .font(.caption)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(device.isOn || device.isLocked ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
        .cornerRadius(10)
        .onTapGesture {
            if !isEditing {
                action()
            }
        }
    }
}

#Preview {
    GridItemView(
        device: SmartDevice(name: "Living room light", type: .light),
        action: { print("Tapped") },
        deleteItem: { print("Delete tapped") },
        isEditing: .constant(true)
    )
}
