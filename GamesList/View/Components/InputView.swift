//
//  InputView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    var title: String
    var placeholder: String

    var isSecure = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(12)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
            } else {
                TextField(placeholder, text: $text)
                    .padding(12)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email", placeholder: "name@example.com")
    }
}
