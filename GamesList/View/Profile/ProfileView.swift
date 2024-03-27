//
//  ProfileView.swift
//  GamesList
//
//  Created by Admin on 13.03.2024.
//
//

import SwiftUI
import Factory

struct ProfileView: View {
    @InjectedObject(\.profileViewModel) var viewModel

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .clipped()

            Text(viewModel.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

            VStack(alignment: .leading) {
                InfoRowView(title: "Email", value: viewModel.email)
                InfoRowView(title: "Country", value: viewModel.country)
                InfoRowView(title: "Gender", value: viewModel.gender)
                InfoRowView(title: "Date of Birth", value: viewModel.dateOfBirth)
                InfoRowView(title: "Date of Registration", value: viewModel.dateOfRegistration)
                InfoRowView(title: "Links", value: viewModel.links)
                InfoRowView(title: "Games In Collection", value: viewModel.gamesCount)
                InfoRowView(title: "Passed Games", value: viewModel.passedGamesCount)

                Text("About me")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .padding(.top, 10)

                Text(viewModel.bio)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
            }
                    .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Button(action: {
                viewModel.editProfile()
            }) {
                PrimaryButton(text: "Edit Profile")
            }

            Button(action: {
                Task {
                    await viewModel.signOut()
                }
            }) {
                PrimaryButton(text: "Sign Out", backgroundColor: Color("LightRed"))
            }
                    .padding(.bottom, 20)
        }
                .task {
                    await viewModel.fetchUser()
                }
                .sheet(isPresented: $viewModel.isEditing, onDismiss: { Task {
                    await viewModel.fetchUser()
                } }) {
                    if let user = viewModel.user {
                        EditProfileView(user: user)
                    }
                }
                .padding()
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        mockServices()
        return ProfileView()
    }
}
