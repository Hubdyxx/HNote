//
//  LogowanieView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct LogowanieView: View {
    //odwołanie się do klasy LogowanieViewViewModel() w ktorej przechowywujemy funkcje
    @StateObject var viewModel = LogowanieViewViewModel()
    //główny widok
    var body: some View {
        NavigationView{
            VStack{
                // Górny blok niebieski ,,HNote"
                HeaderView(text: "HNote",
                           angle: 15,
                           background: .blue)
                
                    .offset(y: 90)
                
                //Logowanie
                
                
                
                Form{
                    //Wyświetlanie błędu jeśli jakieś pole będzie puste !zaprzeczenie notempty**
                    if !viewModel.errormess.isEmpty{
                        Text(viewModel.errormess)
                            .foregroundColor(.red)
                    }
                    TextField("Adres Email", text: $viewModel.email) //odnoszenie się do klasy LogowanieViewViewModel gdzie są przechowywane zmienne email oraz password
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Hasło", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    HNButton(
                        title: "Zaloguj się",
                        background: .blue
                    ){
                        viewModel.login()
                        // proba zalogowania sie
                    }
                    
                    .padding()
                }
                .offset(y: -20)
                
                
                
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
