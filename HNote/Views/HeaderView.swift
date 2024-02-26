//
//  HeaderView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 15))
               
            VStack{
                Text("HNote")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
            }
            .padding(.top,60)
        }
        .frame(width: UIScreen.main.bounds.width * 3,
               height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView()
}
