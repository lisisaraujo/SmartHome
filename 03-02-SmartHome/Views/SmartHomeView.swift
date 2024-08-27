//
//  SmartHomeView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct SmartHomeView: View {
    @State var showRoomView = false
    @State private var text = ""
    @State private var items: [String] = []
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    AddItem()
                    
               
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
