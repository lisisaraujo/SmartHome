import SwiftUI

struct RoomView: View {
    @Binding var showRoomView: Bool
    var devices: [SmartDevice]
    
    var body: some View {
        //lights
        VStack {
            HStack {
                ForEach(devices.filter { $0.type == .light }) { device in
                    Image(systemName: "lamp.ceiling.fill")
                        .font(.system(size: 40))
                        .foregroundStyle(device.isOn ? .yellow : .black)
                }
            }
            .padding(.top, 20)
            
            Spacer()
            HStack {
                    ForEach(devices.filter { $0.type == .heating }) { device in
                        VStack {
                            Gauge(value: device.temperature, in: 0...30) {
                                Image(systemName: "thermometer")
                                    .font(.system(size: 30))
                            } currentValueLabel: {
                                Text(String(format: "%.1f°", device.temperature))
                            } minimumValueLabel: {
                                Text("0°")
                            } maximumValueLabel: {
                                Text("30°")
                            }
                            .gaugeStyle(.accessoryCircular)
                            .tint(Gradient(colors: [.blue, .yellow, .red]))
                            .scaleEffect(1.5)
                            .frame(width: 100, height: 100)

                        }
                    }
                }
            Spacer()
            
            //locks
            HStack {
                ForEach(devices.filter { $0.type == .lock }) { device in
                    Image(systemName: device.isLocked ? "door.left.hand.closed" : "door.left.hand.open")
                        .font(.system(size: 40))
                        .foregroundStyle(device.isLocked ? .green : .black)
                }
            }.padding(.bottom, 20)
            
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
