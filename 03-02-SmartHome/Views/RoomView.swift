import SwiftUI

struct RoomView: View {
    @Binding var showRoomView: Bool
    var devices: [SmartDevice]
    
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
                            .font(.body)
                            .padding(20)
                            .foregroundColor(.black)
                
                    }
                }
                
                Spacer()
                
                //lights
                HStack {
                    ForEach(devices) { device in
                        if device.type == .light {
                                Image(systemName: "lamp.ceiling.fill")
                                    .imageScale(.large)
                                    .foregroundStyle(device.isOn ? .yellow : .black)
                        }
                    }
                }
                
                Spacer()
                
                //thermostats
                HStack {
                    ForEach(devices) { device in
                        if device.type == .heating {
                            HStack{
                                Image(systemName: "thermometer")
                                    .imageScale(.large)
                                    .foregroundStyle(device.isOn ? .red : .blue)
                                
                                Text(String(device.temperature)
                            
                                )
                            }
                            
                        }
                    }
                }
                
                Spacer()
                
                //locks
                HStack {
                    ForEach(devices) { device in
                        if device.type == .lock {
                            VStack{
                                Image(systemName: device.isLocked ? "door.left.hand.closed" : "door.left.hand.open")
                                    .imageScale(.large)
                                    .foregroundStyle(device.isLocked ? .green : .red)
                            }
                        }
                    }
                }
                
                Spacer()
            }
    
                     .background(Color(.secondarySystemBackground))
                     .cornerRadius(15)
                     .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }

}

#Preview {
    RoomView(showRoomView: .constant(true), devices: [
        SmartDevice(name: "Lampe1", type: .light),
        SmartDevice(name: "Lampe2", type: .light, isOn: true),
        SmartDevice(name: "Tür1", type: .lock),
        SmartDevice(name: "Tür2", type: .lock),
        SmartDevice(name: "Tür3", type: .lock, isLocked: false),
        SmartDevice(name: "Thermo1", type: .heating, temperature: 23.0)
    ])
}
