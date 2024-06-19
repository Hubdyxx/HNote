//
//  HNButton.swift
//  HNote
//
//  Created by Hubert Kotlarz on 27/02/2024.
//

import SwiftUI

struct HNButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            //akcje
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        
    }
}
#Preview{
    HNButton(title: "Zarejestruj się", background: .red){
    //akcja
    }
}

