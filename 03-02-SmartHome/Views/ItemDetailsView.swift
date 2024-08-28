//
//  ItemDetailsView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 28.08.24.
//

import SwiftUI

struct ItemDetailsView: View {
    @Binding var device: SmartDevice

    
    var body: some View {
        VStack {
            HStack{
     
                Text(device.isOn ? "On" : "Off")
                    .padding(.horizontal)
                Spacer()
             
                
                Image(systemName: "trash.fill")
                    .foregroundColor(.red)
            }.padding(.horizontal)
            
            Image(systemName: device.type.iconName)
                .font(.largeTitle)
            Text(device.name)
                .font(.caption)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(device.isOn ? Color.green.opacity(0.1) : Color.red.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    ItemDetailsView(device: .constant(SmartDevice(name: "Living room light", type: .light)))
}
