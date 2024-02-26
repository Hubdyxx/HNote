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
        VStack{
            //Nagłówek
            HeaderView()
            //Logowanie
            Form{
                TextField("Adres Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Hasło", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            //Tworzenie konta
            
            Spacer()
        }
    }
}

#Preview {
    LogowanieView()
}
