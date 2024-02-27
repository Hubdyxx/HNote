//
//  NoteEditView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 30/05/2024.
//

// NoteEditView.swift
import SwiftUI

struct NoteEditView: View {
    @ObservedObject var notesManager = NotesManager()
    @State private var noteTitle: String // Dodajemy pole tytułu notatki
    @State private var noteContent: String
    
    var note: Note
    
    init(note: Note) {
        self.note = note
        _noteTitle = State(initialValue: note.title) // Inicjalizujemy tytuł notatki
        _noteContent = State(initialValue: note.content)
    }
    
    var body: some View {
        VStack {
            TextField("Tytuł", text: $noteTitle) // Pole tekstowe do edycji tytułu
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextEditor(text: $noteContent)
                .padding()
        }
        .navigationBarItems(trailing: saveButton)
    }
    
    private var saveButton: some View {
        Button(action: {
            var updatedNote = note
            updatedNote.title = noteTitle // Aktualizujemy tytuł notatki
            updatedNote.content = noteContent
            notesManager.updateNote(updatedNote) { result in
                switch result {
                case .success:
                    // Handle success
                    print("Note updated successfully.")
                case .failure(let error):
                    print("Error updating note: \(error.localizedDescription)")
                }
            }
        }) {
            Text("Save")
        }
    }
}
