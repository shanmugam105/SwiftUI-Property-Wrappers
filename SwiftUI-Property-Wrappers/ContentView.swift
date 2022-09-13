//
//  ContentView.swift
//  SwiftUI-Property-Wrappers
//
//  Created by Sparkout on 13/09/22.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
}

struct UsersListContentView: View {
    @State var usersList: [User] = []
    var body: some View {
        ZStack {
            VStack {
                ForEach(usersList, id: \.id) { item in
                    Text(item.name)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
            .padding()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        usersList.append(User(name: "iOS"))
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                    }
                    .padding()
                }
            }
        }
    }
}
