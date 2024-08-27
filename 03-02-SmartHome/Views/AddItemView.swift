//
//  TextInput.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct AddItemView: View {
    @Binding var text: String
    @Binding var selection: DeviceType
    @Binding var devices: [SmartDevice]
       
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add new smart action", text: $text)
                    .padding(10)
                    .border(.secondary)
                DropdownMenuView(selection: $selection)
            }

            ButtonView(label: "Add") {
                if !text.isEmpty {
                    let newDevice = SmartDevice(name: text, type: selection)
                    devices.append(newDevice)
                    text = ""
                }
            }
            
            ForEach(devices) { device in
                HStack {
                    Text(device.name)
                    Spacer()
                    Text(device.type.rawValue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
        }
        .padding(20)
    }
}

#Preview {
    AddItemView(text: .constant(""),
                selection: .constant(.light),
                devices: .constant([
                    SmartDevice(name: "Living Room Light", type: .light),
                    SmartDevice(name: "Bedroom Heater", type: .heating)
                ]))
}
