//
//  WheelPickerView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 28.08.24.
//

import SwiftUI

struct WheelPickerView: View {
    @Binding var selection: TemperatureUnit

    var body: some View {
        Picker("Select", selection: $selection) {
            ForEach(TemperatureUnit.allCases) { item in
                Text(item.rawValue)
            }
        }
        .pickerStyle(.wheel)
    }
}

#Preview {
    WheelPickerView(selection: .constant(.celsius))
}
