//
//  UserLoginContentView.swift
//  SwiftUI-Property-Wrappers
//
//  Created by Sparkout on 15/09/22.
//

import SwiftUI

class UserDetails: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var loginSucceed: Bool = false
}

struct UserLoginContentView: View {
    @ObservedObject var userDetails: UserDetails = .init()
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Username", text: $userDetails.username)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                
                TextField("Password", text: $userDetails.password)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.gray, style: StrokeStyle(lineWidth: 1.0)))
                Button {
                    if !userDetails.username.isEmpty, !userDetails.password.isEmpty {
                        userDetails.loginSucceed = true
                    }
                } label: {
                    Text("Login")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                
                NavigationLink(isActive: $userDetails.loginSucceed) {
                    LoginSucceedContentView(
                        userDetails: userDetails,
                        goBack: $userDetails.loginSucceed
                    )
                } label: {
                    EmptyView()
                }
            }
            .padding()
        }
    }
}

struct LoginSucceedContentView: View {
    @ObservedObject var userDetails: UserDetails
    @Binding var goBack: Bool
    @State var loginSuccess: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, " + userDetails.username)
                Button {
                    goBack.toggle()
                } label: {
                    Text("Go back")
                }
            }
        }
    }
}
