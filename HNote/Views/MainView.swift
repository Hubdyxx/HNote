//
//  ContentView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LogowanieView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            HNoteListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Start",systemImage: "house")
                }
            NotesListView(viewModel: NotesListViewModel())
                            .tabItem {
                                Label("Notatki", systemImage: "note.text")
                            }
            ProfileView()
                .tabItem {
                    Label("Profil",systemImage: "person.circle")
                }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

