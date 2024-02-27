//
//  NotesListViewModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 30/05/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class NotesListViewModel: ObservableObject {
    @Published var notes: [Note] = [] // Lista notatek
    
    private let db = Firestore.firestore()

    init() {
        fetchNotes()
    }

    func fetchNotes() {
        db.collection("notes").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.notes = documents.compactMap { document -> Note? in
                do {
                    return try document.data(as: Note.self)
                } catch {
                    print("Error decoding note: \(error.localizedDescription)")
                    return nil
                }
            }
        }
    }
    
    func createNote() {
        // Implementacja tworzenia nowej notatki
    }
    
    func deleteNote() {
        // Implementacja usuwania notatki
    }
}


