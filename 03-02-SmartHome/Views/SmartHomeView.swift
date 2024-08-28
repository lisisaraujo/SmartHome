import SwiftUI


struct SmartHomeView: View {
    @State var showRoomView = false
    @State var isEditing = false
    @State private var devices: [SmartDevice] = [
        SmartDevice(name: "Living Room", type: .light, isOn: true),
        SmartDevice(name: "Heater", type: .heating),
        SmartDevice(name: "House", type: .lock, isLocked: true),
        SmartDevice(name: "Kitchen", type: .light),
        SmartDevice(name: "Garden", type: .lock),
        SmartDevice(name: "Bathroom", type: .lock)
    ]
    
    @State private var isGrid: Bool = false
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView {
    
            
                AddItemView(devices: $devices)
                
                HStack {
                    
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Text(isEditing ? "Done" : "Edit")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    
                    Button(action: {
                        isGrid.toggle()
                    }) {
                        Image(systemName: isGrid ? "list.bullet" : "square.grid.2x2")
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 5)
            
                }
                .padding(10)
                
                ZStack {
                    VStack {
                        if isGrid {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(devices) { device in
                                    GridItemView(device: device)
                                }
                            }
                        } else {
                            ForEach(devices.indices, id: \.self) { index in
                                ListItemView(
                                    device: devices[index],
                                    action: {
                                        print("tapped")
                                    },
                                    deleteItem: {
                                        devices.remove(at: index)
                                    },
                                    isEditing: $isEditing
                                )
                            }
                        }
                    }
                    .opacity(showRoomView ? 0 : 1)
                    
                    if showRoomView {
                        ComplexRoomView(showRoomView: $showRoomView, devices: devices)
                            .transition(.opacity)
                    }
                }
            }
            .padding()
            
            Toggle("Room View", isOn: $showRoomView)
                .padding()
                .background(Color.gray.opacity(0.1))
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
