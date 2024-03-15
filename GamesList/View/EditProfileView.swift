//
//  EditProfileView.swift
//  GamesList
//
//  Created by Admin on 15.03.2024.
//
//

import SwiftUI

enum Gender: String, CaseIterable {
    case Female, Male, Other
}

struct EditProfileView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])

                VStack {
                    Form {
                        // image
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
                            HStack {
                                Text("Name: ")
                                    .font(.body)
                                    .foregroundColor(.secondary)

                                TextField("Name", text: .constant("John Doe"))
                                    .multilineTextAlignment(.trailing)
                            }

                            HStack {
                                Text("Email: ")
                                    .font(.body)
                                    .foregroundColor(.secondary)

                                TextField("Email", text: .constant("email@example.com"))
                                    .multilineTextAlignment(.trailing)
                            }

                            Picker("Gender: ", selection: .constant(Gender.Male)) {
                                Text("Female").tag(Gender.Female)
                                Text("Male").tag(Gender.Female)
                                Text("Non binary").tag(Gender.Other)
                            }
                                .foregroundColor(.secondary)
                            DatePicker("Date of Birth: ", selection: .constant(Date()), displayedComponents: .date)
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
                            .foregroundColor(.black)
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            print("Save")
                        }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
