//
//  HNoteListItemsView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct HNoteListView: View {
    
    @StateObject var viewModel: HNoteListViewViewModel
    @FirestoreQuery var items: [HNoteListItem]
    

    
    init(userId: String) {
        //users/<id>/przyp/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/przypomnienia"
        )
        self._viewModel = StateObject(
            wrappedValue: HNoteListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
                    HNoteListItemsView(item: item)
                        .swipeActions{
                            Button("Usuń"){
                                viewModel.usun(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Przypomnienia")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemsView(newItemPresented: $viewModel.showingNewItemView)  
            }
        }
    }
}

#Preview {
    HNoteListView(userId: "")
}
