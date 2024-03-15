//
//  ProfileView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI

struct ProfileView: View {
    var user: User

    @State private var isEditing = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .cornerRadius(50)
                .clipped()

            Text(user.name)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            VStack(alignment: .leading) {
                InfoRowView(title: "Email", value: user.email)
                InfoRowView(title: "Country", value: user.country)
                InfoRowView(title: "Gender", value: user.gender)
                InfoRowView(title: "Date of Birth", value: user.birthDate)
                InfoRowView(title: "Registered", value: user.registrationDate)
                InfoRowView(title: "Games in Collection", value: "\(user.gamesCount)")
                InfoRowView(title: "Passed Games", value: "\(user.passedGamesCount)")

                Text("About me")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .padding(.top, 10)

                Text(user.bio)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer()
            }
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Button(action: {
                isEditing.toggle()
            }) {
                PrimaryButton(text: "Edit Profile")
            }

            Button(action: {

            }) {
                PrimaryButton(text: "Sign Out")
            }
                .padding(.bottom, 20)
        }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isEditing) {
                EditProfileView()
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK)
    }
}
