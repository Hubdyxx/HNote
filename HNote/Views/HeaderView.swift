//
//  HeaderView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct HeaderView: View {
    
    let text: String
    let angle: Double
    let background: Color
   
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
               
            VStack{
                Text(text)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
            }
            .padding(.top,60)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -200)
    }
}

#Preview {
    HeaderView(text: "title", angle: 15, background: .blue)
}
