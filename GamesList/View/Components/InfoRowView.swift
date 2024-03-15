//
//  ProfileInfoRow.swift
//  GamesList
//
//  Created by Admin on 14.03.2024.
//
//

import SwiftUI

struct InfoRowView: View {
    var title: String
    var value: String

    var body: some View {
        HStack {
            Text("\(title): ")
                .font(.body)
                .foregroundColor(.secondary)

            Text(value)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}

struct ProfileInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(title: "Email", value: "example@gmail.com")
    }
}
