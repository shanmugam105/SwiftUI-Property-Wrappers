//
//  AddressDetailsViewModel.swift
//  SwiftUI-Property-Wrappers
//
//  Created by Sparkout on 14/09/22.
//

import SwiftUI

class AddressDetailsViewModel: ObservableObject {
    @Published var usersList: [User] = []
    
    func fetchUser() {
        usersList.append(User(name: "User \(usersList.count + 1)"))
    }
}

struct AddressDetailsContentView: View {
    
    @ObservedObject var addressDetails: AddressDetailsViewModel = .init()
    
    var body: some View {
        ZStack {
            VStack {
                ForEach(addressDetails.usersList, id: \.id) { item in
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
                        addressDetails.fetchUser()
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
