//
//  SmartHomeView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State var showRoomView = false
    @State  var text = ""
    @State  var selection: DeviceType = .light
    @State  var devices: [SmartDevice] = [
        SmartDevice(name: "Living room light", type: .light),
        SmartDevice(name: "Heater", type: .heating),
        SmartDevice(name: "House door", type: .lock)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    AddItemView(text: $text, selection: $selection, devices: $devices)
                    
                }
                Toggle("Room View", isOn: $showRoomView)
                    .padding()
                    .background(Color.gray.opacity(0.1))
            }
            
            if showRoomView {
                RoomView(showRoomView: $showRoomView)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .animation(.default, value: showRoomView)
    }
}


#Preview {
    SmartHomeView()
}
