//
//  NewItemsViewViewModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemsViewViewModel: ObservableObject {
   
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() {}
    
    func save() {
        
        guard canSave else {
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //tworzenie modelu
        let newId = UUID().uuidString
        let newItem = HNoteListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        //zapisywanie modelu do bazy danych
        
        let baza = Firestore.firestore()
        
        baza.collection("users")
            .document(uId)
            .collection("przypomnienia")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
