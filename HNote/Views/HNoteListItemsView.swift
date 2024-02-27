//
//  HNoteListItemsView.swift
//  HNote
//
//  Created by Hubert Kotlarz on 24/02/2024.
//

import SwiftUI

struct HNoteListItemsView: View {
    
    @StateObject var viewModel = HNoteListItemsViewViewModel()
    
    let item: HNoteListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.green)
            }
        }
    }
}

#Preview {
    HNoteListItemsView(item: .init(id: "123", title: "get milk", dueDate: Date()
        .timeIntervalSince1970,
        createdDate: Date()
        .timeIntervalSince1970,
        isDone: true
    ))
}
