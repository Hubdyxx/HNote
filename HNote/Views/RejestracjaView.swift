//
//  RejestracjaView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct RejestracjaView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        
        VStack {
            HeaderView(text: "Rejestracja", 
                       angle: -15,
                       background: .red)
            .padding(.top,70)
            
            Form{
                TextField("Imię:",text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                TextField("Adres Email:",text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Hasło:",text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                HNButton(
                    title: "Zarejestruj się!",
                    background: .red){
                    // proba zalogowania sie
                }
                
                .padding()
                
                
            }
            
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RejestracjaView()
}
