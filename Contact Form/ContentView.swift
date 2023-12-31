//
//  ContentView.swift
//  Contact Form
//
//  Created by Rich Polanco on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress = ""
    @State private var phoneNumber = ""
    @State private var message = "Write your message here..."
    @State private var subject = "Help"
    @State private var includeLogs = false

    @State private var preferredContactMethod = ContactMethod.email

    enum ContactMethod {
        case email, phone
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("How can we reach you?")) {
                    Picker("Contact Method", selection: $preferredContactMethod) {
                        Text("Email").tag(ContactMethod.email)
                        Text("Phone").tag(ContactMethod.phone)
                    }
                    .pickerStyle(.segmented)
                    switch preferredContactMethod {
                    case .email:
                        TextField("Email Address", text: $emailAddress)
                    case .phone:
                        TextField("Phone Number", text: $phoneNumber)
                    }
                }
                Section(header: Text("What can we help you with?")) {
                    Picker("Subject", selection: $subject) {
                        ForEach(["Help", "Suggestion", "Feature Request"], id: \.self) { subject in
                            Text(subject)
                        }
                    }
                }
                Section(header: Text("Briefly explain what‘s going on.")) {
                    TextEditor(text: $message)
                }
                Section(footer: Text("This information will be sent anonymously.")) {
                    Toggle("Include Logs", isOn: $includeLogs)
                }
                Button("Submit", action: {
                    print("Submit button tapped")
                })
            }
            .navigationTitle("Contact Us!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
