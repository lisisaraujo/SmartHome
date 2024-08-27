//
//  ButtonView.swift
//  03-02-SmartHome
//
//  Created by Lisis Ruschel on 26.08.24.
//

import SwiftUI

struct ButtonView: View {
    var label: String
    var action: () -> Void
    
    var body: some View {
        Button(label) {
            action()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
 
    }
}

#Preview {
    ButtonView(label: "Button"){
        print("Button tapped")
    }
}
