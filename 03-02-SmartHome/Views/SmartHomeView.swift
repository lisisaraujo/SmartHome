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
    @State private var selectedDevice: SmartDevice?
    @State private var showSmartDevice = false
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
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
                                    ForEach($devices) { $device in
                                        GridItemView(
                                            device: device,
                                            action: {
                                                selectedDevice = device
                                                showSmartDevice = true
                                            },
                                            deleteItem: {
                                                devices.removeAll { $0.id == device.id }
                                            },
                                            isEditing: $isEditing
                                        )
                                    }
                                }
                            } else {
                                ForEach($devices) { $device in
                                    ListItemView(
                                        device: device,
                                        action: {
                                            selectedDevice = device
                                            showSmartDevice = true
                                        },
                                        deleteItem: {
                                            devices.removeAll { $0.id == device.id }
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
            
            if showSmartDevice, let deviceIndex = devices.firstIndex(where: { $0.id == selectedDevice?.id }) {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showSmartDevice = false
                    }
                
                SmartDeviceView(
                    selectedDevice: $devices[deviceIndex],
                    showSmartDevice: $showSmartDevice, heatingValue: devices[deviceIndex].temperature
                )
                .animation(.default, value: showSmartDevice)
            }
        }

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
