//
//  PrimaryButton.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    let backgroundColor = Color(.systemIndigo)
    
    var body: some View {
        Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .cornerRadius(10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Button")
    }
}
