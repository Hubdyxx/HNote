//
//  NewItemsView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct NewItemsView: View {
    
    @StateObject var viewModel = NewItemsViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Dodaj przypomnienie")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //tytul
                TextField("Tytuł", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //data
                DatePicker("Wybierz datę", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                HNButton(title: "Zapisz",
                         background: .green) 
                {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else{
                        viewModel.showAlert = true
                    }
                    //zamyka na widok po wcisnieciu save
                }
                         .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Błąd!"),
                      message: Text ("Wypełnij wszystkie pola oraz zaznacz datę nie starszą niż dzisiejsza."))
            }
            
        }
    }
}
//widok dodania nowego przypomnienia
#Preview {
    NewItemsView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
