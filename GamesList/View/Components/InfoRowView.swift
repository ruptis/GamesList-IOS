//
//  ProfileInfoRow.swift
//  GamesList
//
//  Created by Admin on 14.03.2024.
//
//

import SwiftUI

struct InfoRowView: View {
    enum InfoType {
        case defaultType
        case email
        case phone
        case website
    }

    var title: String
    var value: String
    var type: InfoType = .defaultType

    var body: some View {
        HStack(alignment: .top) {
            Text("\(title): ")
                .font(.body)
                .foregroundColor(.secondary)

            switch type {
            case .email:
                Link(value, destination: URL(string: "mailto:\(value)")!)
                    .font(.body)
                    .foregroundColor(.primary)
            case .phone:
                Link(value, destination: URL(string: "tel://\(value)")!)
                    .font(.body)
                    .foregroundColor(.primary)
            case .website:
                Link(value, destination: URL(string: value)!)
                    .font(.body)
                    .foregroundColor(.primary)
            default:
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
    }
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(title: "Email", value: "example@gmail.com")
    }
}
