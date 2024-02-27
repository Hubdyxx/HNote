//
//  LogowanieView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct LogowanieView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack{
                //Nagłówek
                HeaderView(text: "HNote",
                           angle: 15,
                           background: .blue)
                //Logowanie
                Form{
                    TextField("Adres Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    SecureField("Hasło", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    HNButton(
                        title: "Zaloguj się",
                        background: .blue){
                        // proba zalogowania sie
                    }
                    .padding()
                }
                .offset(y: -50)
                //Tworzenie konta
                
                VStack {
                    Text("Nie masz konta?")
                    
                    NavigationLink("Utwórz konto!",
                                   destination: RejestracjaView())
                }
                .padding(.bottom,50)
                
                Spacer()
            }
            
        }
        
    }
   
}

#Preview {
    LogowanieView()
}
