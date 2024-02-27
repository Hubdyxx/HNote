//
//  EditedNote.swift
//  HNote
//
//  Created by Hubert Kotlarz on 30/05/2024.
//

import Foundation

struct EditedNote {
    var id: UUID // ID notatki
    var content: String // Treść notatki

    init(id: UUID, content: String) {
        self.id = id
        self.content = content
    }
}

