//
//  SmartHomeView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State var showRoomView = false
    @State private var devices: [SmartDevice] = [
        SmartDevice(name: "Living room light", type: .light),
        SmartDevice(name: "Heater", type: .heating),
        SmartDevice(name: "House door", type: .lock)
    ]
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    AddItemView(devices: $devices)
                    
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
