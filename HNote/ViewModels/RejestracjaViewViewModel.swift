//
//  RejestracjaViewViewModel.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register(){
        guard walidacja() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in //weak self uzywane do czyszczenia pamieci zeby nie bylo wycieku danych w pamieci
            guard let userId = result?.user.uid else { //utworzenie nowego userid
                return
            }
                self?.insertUserRecord(id: userId)
        }
        
    }
    //utworzenie objektu nowego uzytkownika w bazie danych
    //slownik
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        //wstawianie nowego uzytkownika do bazy danych
        let baza = Firestore.firestore()
        
        baza.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func walidacja() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        guard password.count >= 6 else {    //haslo 6 lub powyzej 6 znakow
            return false
        }
        return true
    }
}
