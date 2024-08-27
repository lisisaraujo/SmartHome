//
//  RoomView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI


struct RoomView: View {
    @Binding var showRoomView: Bool
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.bottom) 
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showRoomView = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .padding(30)
                    }
                }
                
                Spacer()
                Text("Room View Content")
                Spacer()
            }
        }
    }
}


struct RoomViewPreview: View {
    @State private var showRoomView = false
    
    var body: some View {
        RoomView(showRoomView: $showRoomView)
    }
}

#Preview {
    RoomViewPreview()
}
