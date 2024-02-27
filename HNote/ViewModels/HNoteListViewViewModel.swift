//
//  HNoteListViewViewModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseFirestore
import Foundation
//widok dla wielu przypomnien
class HNoteListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
//    usuwanie przypomnien
    
    func usun(id: String){
        let baza = Firestore.firestore()
        
        baza.collection("users")
            .document(userId)
            .collection("przypomnienia")
            .document(id)
            .delete()
        
    }
}
