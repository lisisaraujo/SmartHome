//
//  ListItemView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 27.08.24.
//

import SwiftUI

struct ListItemView: View {
    let device: SmartDevice
    let action: () -> Void
    let deleteItem: () -> Void
    
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack{
            
            if isEditing {
                
                Button(action: deleteItem) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                }
                
                
            }
            
            HStack {
                Image(systemName: device.type.iconName)
                Text(device.name)
                Spacer()
                if isEditing {
                  Image(systemName: "chevron.forward")
                }else {
                    Text(device.type.rawValue)
                }
            
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(20)
            .onTapGesture(perform: action)
            
        }
    }
}


#Preview {
    ListItemView(
        device: SmartDevice(name: "Living room light", type: .light),
        action: { print("Tapped") },
        deleteItem: { print("Delete tapped") },
        isEditing: .constant(true)
    )
    
}
