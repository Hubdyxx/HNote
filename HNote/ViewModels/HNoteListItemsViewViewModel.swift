//
//  HNoteListItemsViewViewModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
//widok dla pojedynczego elementu przypomnien
class HNoteListItemsViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: HNoteListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let baza = Firestore.firestore()
        baza.collection("users")
            .document(uid)
            .collection("przypomnienia")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
