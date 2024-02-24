//
//  HNoteApp.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseCore
import SwiftUI

@main
struct HNoteApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
