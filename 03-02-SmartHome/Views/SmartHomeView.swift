import SwiftUI

struct SmartHomeView: View {
    @State var showRoomView = false
    @State private var devices: [SmartDevice] = [
        SmartDevice(name: "Living room light", type: .light),
        SmartDevice(name: "Heater", type: .heating),
        SmartDevice(name: "House door", type: .lock)
    ]
    
    @State private var isGrid: Bool = false
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    AddItemView(devices: $devices)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isGrid.toggle()
                        }) {
                            Image(systemName: isGrid ? "list.bullet" : "square.grid.2x2")
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                    
                    if isGrid {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(devices) { device in
                                GridItemView(device: device)
                            }
                        }
                    } else {
                        ForEach(devices) { device in
                            ListItemView(device: device)
                        }
                    }
                }.padding()
                
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

extension DeviceType {
    var iconName: String {
        switch self {
        case .light: return "lightbulb"
        case .heating: return "thermometer"
        case .lock: return "lock"
        case .curtains: return "curtains.closed"
        }
    }
}

#Preview {
    SmartHomeView()
}
