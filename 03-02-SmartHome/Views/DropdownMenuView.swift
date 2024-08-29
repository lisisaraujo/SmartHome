//
//  DropdownMenuView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct DropdownMenuView: View {
    @Binding var selection: DeviceType

    var body: some View {
        Picker("Select", selection: $selection) {
            ForEach(DeviceType.allCases, id: \.self) { device in
                Text(device.rawValue).tag(device)
            }
        }
        .pickerStyle(.menu)
    }
}

#Preview {
    DropdownMenuView(selection: .constant(.light))
}
