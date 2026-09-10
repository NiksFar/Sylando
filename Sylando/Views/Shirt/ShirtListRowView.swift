//
//  ShirtListRowView.swift
//  Sylando
//
//  Created by Mykyta on 10.09.26.
//

import SwiftUI

struct ShirtListRowView: View {
    
    @Environment(ShirtsViewModel.self) private var shirtsVM
    
    let shirt: Shirt
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Text(shirt.title)
                Spacer()
                Text("\(shirt.price, specifier: "%.2f") €")
            }
            Text(shirt.size)
        }
        .padding()
        .swipeActions {
            Button {
                shirtsVM.deleteShirt(shirt: shirt)
            } label: {
                Label("Löschen", systemImage: "trash")
            }
            .tint(.red)
        }
    }
        
}

#Preview {
    ShirtListRowView(shirt: Shirt(title: "Graphic Print Tee", price: 24.99, size: "S"))
        .environment(ShirtsViewModel())
}
