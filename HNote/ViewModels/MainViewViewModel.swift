//
//  MainViewViewModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        //funkcja sprawdzajaca w bazie danych czy uzytkownik jest zalogowany
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    //sprawdza czy uzytkownik jest zalogowany
    public var isSignedIn: Bool { //bool jako true albo false
        return Auth.auth().currentUser != nil
    }
}
