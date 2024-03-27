//
//  ProfileInputView.swift
//  GamesList
//
//  Created by Admin on 27.03.2024.
//

import SwiftUI

struct ProfileInputView: View {
    var title: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text("\(title): ")
                    .font(.body)
                    .foregroundColor(.secondary)

            TextField(placeholder, text: $text)
                    .multilineTextAlignment(.trailing)
        }
    }
}

struct ProfileInputView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInputView(title: "Name", placeholder: "Name", text: .constant("John Doe"))
    }
}
