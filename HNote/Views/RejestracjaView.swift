//
//  RejestracjaView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct RejestracjaView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack {
            HeaderView(text: "Rejestracja", 
                       angle: -15,
                       background: .red)
            .padding(.top,70)
            
            Form{
                TextField("Imię:",text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()

                TextField("Adres Email:",text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Hasło:",text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                HNButton(
                    title: "Zarejestruj się!",
                    background: .red
                ){
                    viewModel.register()
                    // proba rejestrowania sie
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
