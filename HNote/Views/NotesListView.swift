//
//  NotesListView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 30/05/2024.
//
// NotesListView.swift
import SwiftUI

struct NotesListView: View {
    @ObservedObject var notesManager = NotesManager()
    @State private var notes: [Note] = []
    @ObservedObject var viewModel: NotesListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes) { note in
                    NavigationLink(destination: NoteEditView(note: note)) {
                        Text(note.title)
                    }
                }
                .onDelete(perform: deleteNote)
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: addButton)
        }
        .onAppear {
            fetchNotes()
        }
    }
    
    private func fetchNotes() {
        notesManager.fetchNotes { result in
            switch result {
            case .success(let notes):
                self.notes = notes
            case .failure(let error):
                print("Error fetching notes: \(error.localizedDescription)")
            }
        }
    }
    
    private func deleteNote(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let noteToDelete = notes[index]
        notesManager.deleteNote(noteToDelete) { result in
            switch result {
            case .success:
                // Remove the note from the local array
                notes.remove(atOffsets: offsets)
            case .failure(let error):
                print("Error deleting note: \(error.localizedDescription)")
            }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            // Create a new note
            let newNote = Note(title: "Tytuł notatki", content: "Treść notatki") // Utwórz nową notatkę
            notesManager.addNote(newNote) { result in // Użyj metody addNote
                switch result {
                case .success:
                    // Pobierz ponownie notatki po pomyślnym zapisaniu nowej notatki
                    fetchNotes()
                case .failure(let error):
                    print("Error saving note: \(error.localizedDescription)")
                }
            }
        }) {
            Image(systemName: "plus")
        }
    }

}
