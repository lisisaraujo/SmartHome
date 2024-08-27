//
//  DropdownMenuView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct DropdownMenuView: View {
    @Binding var selection: DeviceType
    let listItems: [DeviceType] = [.light, .heating, .lock, .curtains]

    var body: some View {
        Picker("Select", selection: $selection) {
            ForEach(listItems, id: \.self) { item in
                Text(item.rawValue).tag(item)
            }
        }
        .pickerStyle(.menu)
    }
}

#Preview {
    DropdownMenuView(selection: .constant(.light))
}
