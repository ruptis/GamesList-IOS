//
//  EditProfileView.swift
//  GamesList
//
//  Created by Admin on 15.03.2024.
//
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var viewModel: EditProfileViewModel

    @Environment(\.dismiss) var dismiss

    init(user: User) {
        viewModel = EditProfileViewModel(user: user)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack {
                    Form {
                        Section(header: Text("Profile Picture")) {
                            HStack {
                                Spacer()
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .padding(.vertical, 10)
                                Spacer()
                            }
                        }

                        Section(header: Text("Personal Info")) {
                            ProfileInputView(title: "Name", placeholder: "Name", text: $viewModel.name)

                            ProfileInputView(title: "Email", placeholder: "Email", text: $viewModel.email)

                            ProfileInputView(title: "Country", placeholder: "Country", text: $viewModel.country)

                            ProfileInputView(title: "Links", placeholder: "Links", text: $viewModel.links)

                            Picker("Gender: ", selection: $viewModel.gender) {
                                Text("Select Gender").tag(Optional<User.Gender>(nil)).font(.body)
                                Text("Female").tag(Optional(User.Gender.Female))
                                Text("Male").tag(Optional(User.Gender.Male))
                                Text("Non binary").tag(Optional(User.Gender.Other))
                            }
                                .foregroundColor(.secondary)

                            DatePicker("Date of Birth: ", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                                .foregroundColor(.secondary)
                        }

                        Section(header: Text("About Me")) {
                            TextEditor(text: $viewModel.bio)
                                .frame(minHeight: 100)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                            .font(.subheadline)
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            Task {
                                do {
                                    try await viewModel.save()
                                    dismiss()
                                } catch {
                                    print(error.localizedDescription)
                                }
                            }
                        }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK)
    }
}
