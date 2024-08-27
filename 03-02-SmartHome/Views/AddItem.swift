//
//  TextInput.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct AddItem: View {
    @Binding var text: String
    @State private var items: [String] = []
    
    var body: some View {
            VStack {
                HStack{
                    TextField("Add new smart action", text: $text)
                        .padding(10)
                        .border(.secondary)
                    DropdownMenuView()
                }
              
          
                ButtonView(label: "Add") {
                    if !text.isEmpty {
                        items.append(text)
                        text = ""
                    }
                }
                
            }.padding(20)
            
        
            ForEach(items, id: \.self) { item in
                Text(item)
            }
        }
    
}

#Preview {
    AddItem()
}
