//
//  DropdownMenuView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct DropdownMenuView: View {
    @State private var selection = "Light"
    let listItems = ["💡Light", "♨Heatig", "🔐Door", "🥱Curtains"]

    var body: some View {
            Picker("Select a paint color", selection: $selection) {
                ForEach(listItems, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
    }
}

#Preview {
    DropdownMenuView()
}
