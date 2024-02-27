//
//  NotesManager.swift
//  HNote
//
//  Created by Hubert Kotlarz on 30/05/2024.
//

// NotesManager.swift
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class NotesManager: ObservableObject {
    private let db = Firestore.firestore()
    
    func fetchNotes(completion: @escaping (Result<[Note], Error>) -> Void) {
        db.collection("notes").getDocuments { querySnapshot, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let notes = querySnapshot?.documents.compactMap { document -> Note? in
                    do {
                        let note = try document.data(as: Note.self)
                        return note
                    } catch {
                        print("Error decoding note: \(error.localizedDescription)")
                        return nil
                    }
                } ?? []
                completion(.success(notes))
            }
        }
    }
    
    func addNote(_ note: Note, completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            _ = try db.collection("notes").addDocument(from: note, completion: { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            })
        } catch {
            completion(.failure(error))
        }
    }
    
    func updateNote(_ note: Note, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let noteID = note.id else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Note ID is missing"])))
            return
        }
        do {
            try db.collection("notes").document(noteID).setData(from: note, merge: true)
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
    
    func deleteNote(_ note: Note, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let noteID = note.id else {
            completion(.failure(NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: "Note ID is missing"])))
            return
        }
        db.collection("notes").document(noteID).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
