//
//  ProfileView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else{
                    Text("Ładowanie profilu...")
                }
            }
            .navigationTitle("Profil")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        //avatar
        Image(systemName:  "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        //info uzytkownika
        VStack(alignment: .leading) {
            HStack {
                Text("Imie: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Zarejestrowany od: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        //wyloguj sie
        
        Button("Wyloguj się") {
            viewModel.logOut()
        }
        .tint(.red)
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
