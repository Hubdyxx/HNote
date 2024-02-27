//
//  NoteModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 30/05/2024.
//

// Note.swift
import Foundation
import FirebaseFirestoreSwift

struct Note: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var content: String
}
