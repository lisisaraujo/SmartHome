//
//  TextInput.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct AddItemView: View {
    @State private var text = ""
    @State private var selection: DeviceType = .light
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
            
        }
        .padding(20)
    }
}

#Preview {
    AddItemView(devices: .constant([SmartDevice(name: "Living room light", type: .light)]))
}
