//
//  User.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
