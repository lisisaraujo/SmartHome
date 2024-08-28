//
//  DatePickerView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 28.08.24.
//

import SwiftUI

struct DatePickerView: View {
    @State private var date = Date.now

    var body: some View {
        VStack {
            DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }

            Text("Date is \(date.formatted(date: .long, time: .omitted))")
        }
    }
}

#Preview {
    DatePickerView()
}
