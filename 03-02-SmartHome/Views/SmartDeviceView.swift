//
//  ItemDetailsView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 28.08.24.
//

import SwiftUI

struct SmartDeviceView: View {
    @Binding var selectedDevice: SmartDevice
    @Binding var showSmartDevice: Bool
    @State  var heatingValue: Double


    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    showSmartDevice = false
                }){
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding()

            VStack {
                Grid {
                    GridRow {
                        Image(systemName: selectedDevice.type.iconName)
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        switch selectedDevice.type {
                        case .light:
                            Toggle(selectedDevice.name, isOn: $selectedDevice.isOn)
                                .padding()
                        case .lock:
                            Button(selectedDevice.isLocked ? "Locked" : "Open"){
                                selectedDevice.isLocked.toggle()
                            }
                        case .heating:
                            Slider(value: $heatingValue, in: 0...30, step: 0.5){
                                
                            currentValueLabel: {
                                Text(String(format: "%.1f°", device.temperature))
                            }
                                
                            } minimumValueLabel: {
                                Text(String (format: "%.0f", heatingValue))
                            } maximumValueLabel: {
                                Text("")
                            }
                            
                            
                                .onChange(of: heatingValue) { newValue in
                                    selectedDevice.temperature = newValue
                                }
                        default:
                            EmptyView()
                        }
                    }
                }.padding(.horizontal)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(selectedDevice.isOn || selectedDevice.isLocked ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
            .cornerRadius(10)
        }
        
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding()
    }
}

#Preview {
SmartDeviceView(
        selectedDevice: .constant(SmartDevice(name: "Living Room", type: .light, isOn: true)),
        showSmartDevice: .constant(true), heatingValue: 25.0
    )
}
