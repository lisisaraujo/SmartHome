//
//  ComplexRoomView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 28.08.24.
//

import SwiftUI

struct ComplexRoomView: View {
    @Binding var showRoomView: Bool
    var devices: [SmartDevice]
    
    var body: some View {
        ZStack {
        
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                // Close button
                HStack {
                    Spacer()
                    Button(action: {
                        showRoomView = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.body)
                            .padding(20)
                            .foregroundColor(.black)
                    }
                }
                
                // Room visualization
                ZStack {
                    // Background wall
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemGray5))
                        .frame(height: 200)
                        .overlay(
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    // Left wall
                                    Path { path in
                                        path.move(to: CGPoint(x: 10, y: 40))
                                        path.addLine(to: CGPoint(x: 60, y: 0))
                                        path.addLine(to: CGPoint(x: 60, y: 150))
                                        path.addLine(to: CGPoint(x: 10, y: 190))
                                        path.closeSubpath()
                                    }
                                    .fill(Color(UIColor.systemGray4))
                                }
                            }
                        )
                        .padding([.leading, .trailing], 25)
                    
                    // Floor
                    Path { path in
                        path.move(to: CGPoint(x: 100, y: 170))
                        path.addLine(to: CGPoint(x: 300, y: 170))
                        path.addLine(to: CGPoint(x: 280, y: 210))
                        path.addLine(to: CGPoint(x: 50, y: 212))
                        path.closeSubpath()
                    }
                    .fill(Color(UIColor.systemGray4))
                    
                    // Carpet
                    Path { path in
                        path.move(to: CGPoint(x: 160, y: 170))
                        path.addLine(to: CGPoint(x: 270, y: 170))
                        path.addLine(to: CGPoint(x: 255, y: 195))
                        path.addLine(to: CGPoint(x: 145, y: 195))
                        path.closeSubpath()
                    }
                    .fill(Color.red)
                    
                    RoomView(showRoomView: $showRoomView, devices: devices)

                }
                .frame(width: 350, height: 220)
                .background(Color(UIColor.systemGroupedBackground))
                .cornerRadius(12)
                .shadow(radius: 5)
                
         
              
            }
        }
    }
}

#Preview {
    ComplexRoomView(showRoomView: .constant(true), devices: [
        SmartDevice(name: "Lampe1", type: .light),
        SmartDevice(name: "Lampe2", type: .light, isOn: true),
        SmartDevice(name: "Tür1", type: .lock),
        SmartDevice(name: "Tür2", type: .lock),
        SmartDevice(name: "Tür3", type: .lock, isLocked: false),
        SmartDevice(name: "Thermo1", type: .heating, temperature: 23.0)
    ])
}
