//
//  LogowanieViewViewModels.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//
import FirebaseAuth
import Foundation

class LogowanieViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errormess = ""
    
    init() {}
    //funkcja logowania sie
    func login(){
      //wywolanie walidacji danych w funkcji login()
        //guard - kod bedzie wykonywany jesli dany warunek zostanie spelniony
        guard walidacja() else {
            return
        }
        //proba logowania sie przez firebase
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    //private zapewnia ze moze byc wykorzystany tylko w tej funkcji
   private func walidacja() -> Bool{ //bool wykorzystany dla warunku true albo false
       errormess = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
             !password.trimmingCharacters(in: .whitespaces).isEmpty else{
           
           errormess = "Wypełnij wszystkie pola!"
           return false
       }
       guard email.contains("@") && email.contains(".") else {
           errormess = "Popraw adres email"
           return false
       }
       return true
        
    }
    
    
}
