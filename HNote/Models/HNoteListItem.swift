//
//  HNoteListItem.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import Foundation

struct HNoteListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

